#! bin/sh
LEANOTE_VERSION=2.6
wget https://jaist.dl.sourceforge.net/project/leanote-bin/${LEANOTE_VERSION}/leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz
tar zxf leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz
mv leanote/mongodb_backup .
rm -rf leanote && rm leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz
