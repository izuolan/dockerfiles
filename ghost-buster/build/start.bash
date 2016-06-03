#!/bin/bash

GHOST="/ghost"
OVERRIDE="/ghost-override"

CONFIG="config.js"
DATA="content/data"
IMAGES="content/images"
THEMES="content/themes"

cd "$GHOST"

# Symlink data directory.
mkdir -p "$OVERRIDE/$DATA"
rm -fr "$DATA"
ln -s "$OVERRIDE/$DATA" "content"

# Symlink images directory
mkdir -p "$OVERRIDE/$IMAGES"
rm -fr "$IMAGES"
ln -s "$OVERRIDE/$IMAGES" "$IMAGES"

# Symlink config file.
if [[ -f "$OVERRIDE/$CONFIG" ]]; then
  rm -f "$CONFIG"
  ln -s "$OVERRIDE/$CONFIG" "$CONFIG"
fi

# Symlink themes.
if [[ -d "$OVERRIDE/$THEMES" ]]; then
  for theme in $(find "$OVERRIDE/$THEMES" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
  do
    rm -fr "$THEMES/$theme"
    ln -s "$OVERRIDE/$THEMES/$theme" "$THEMES/$theme"
  done
fi

sed -i -e "s|http://my-ghost-blog.com|${BLOG_DOMAIN}|g" /ghost/config.js

#start background watcher for buster
while inotifywait -e modify /ghost/content/data/ghost.db; do sleep 10 && /ghost/publish.sh; done &

# Start Ghost
chown -R ghost:ghost /data /ghost /ghost-override
su ghost << EOF
cd "$GHOST"
NODE_ENV=${NODE_ENV:-production} npm start
EOF
