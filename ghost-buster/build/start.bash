#!/bin/bash

GHOST="/ghost"

sed -i -e "s|http://my-ghost-blog.com|${BLOG_DOMAIN}|g" /ghost/config.js

mkdir ${GHOST}/content/data/
#start background watcher for buster
while inotifywait -e modify /ghost/content/data/; do sleep 10 && /ghost/publish.sh; done &

# Start Ghost
chown -R ghost:ghost /ghost
su ghost << EOF
cd "$GHOST"
NODE_ENV=${NODE_ENV:-production} npm start
EOF

