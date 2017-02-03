#! bin/sh
LEANOTE_VERSION=2.3
wget https://jaist.dl.sourceforge.net/project/leanote-bin/${LEANOTE_VERSION}/leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz
tar zxf leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz
rm leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz
sed -i 's/db.host=127.0.0.1/db.host=mongo/g' ./leanote/conf/app.conf
