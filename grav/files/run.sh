#!/bin/ash

[ -f /run-pre.sh ] && /run-pre.sh

if [ ! -d /usr/html ] ; then
  mkdir -p /usr/html
  chown -R root:root /usr/html
else
  chown -R root:root /usr/html
fi

if [ ! -d /usr/html/system ] ; then
  curl -fLk -o /tmp/grav.zip  "https://github.com/getgrav/grav/releases/download/$GRAV_VERSION/grav-admin-v$GRAV_VERSION.zip"
  mkdir /tmp/grav-src
  unzip /tmp/grav.zip -d /tmp/grav-src
  mv -f /tmp/grav-src/grav-admin/* /usr/html/
  rm -R /tmp/grav*
  chown -R root:root /usr/html
else
  chown -R root:root /usr/html
fi

chown -R root:root /usr/html

find /usr/html -type f | xargs chmod 664
find /usr/html -type d | xargs chmod 775
find /usr/html -type d | xargs chmod +s

# start php-fpm
mkdir -p /usr/logs/php-fpm
php-fpm7 -R

# start nginx
mkdir -p /usr/logs/nginx
mkdir -p /tmp/nginx
chown nginx /tmp/nginx
nginx
