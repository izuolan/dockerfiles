#!/bin/sh
if [ ! -n "/work/html" ]; then ln -s /hugo/public /work/html; fi
cd /hugo && hugo server --baseURL=$BASE_URL --bind=0.0.0.0 --appendPort=false > /tmp/hugo.log
tail -fn0 /tmp/hugo.log | \
while read line; do
    echo "$line" | grep "total"
    if [ "$?" = "0" ]; then
        cd /work && npm run build
    fi
done
