#!/bin/bash

GHOST="/ghost"

sed -i -e "s|http://my-ghost-blog.com|${BLOG_DOMAIN}|g" /ghost/config.js

#start background watcher for buster
while inotifywait -e modify /ghost/content/data/; do sleep 10 && /ghost/publish.sh; done &

# Start Ghost
chown -R ghost:ghost /data /ghost
su ghost << EOF
cd "$GHOST"
NODE_ENV=${NODE_ENV:-production} npm start
EOF

