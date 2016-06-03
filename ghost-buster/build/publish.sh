#!/bin/sh
echo "building static site"
buster generate
echo "export md"
ghost-export /ghost /export.md

# workarounds for buster's issues
sed -i -e 's|/index.html#disqus_thread|/#disqus_thread|g' /ghost/static/index.html
find /ghost/static/tag -name index.html | xargs sed -i -e 's|/index.html#disqus_thread|/#disqus_thread|g'
curl http://127.0.0.1:2368/rss/ > /ghost/static/rss
curl http://127.0.0.1:2368/rss/ > /ghost/static/rss.xml

echo "publishing ..."
#copy from  static/* to external desitnation
