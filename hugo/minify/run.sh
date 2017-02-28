#!/bin/sh
SEPARATOR="================================================================"
echo "正在执行初次压缩："
echo $SEPARATOR
echo "正在压缩页面："
npm run build
echo "页面已经压缩，容器进入监视状态。"
VOLUMES="/work/html"
INOTIFY_EVENTS="create,delete,modify,move"
INOTIFY_OPTONS="--monitor --exclude=public"
inotifywait -rqe ${INOTIFY_EVENTS} ${INOTIFY_OPTONS} ${VOLUMES} | \
    while read -r notifies;
    do
        echo $SEPARATOR
        echo "文件有变动："
        echo "$notifies"
        echo "正在重新压缩页面："
        npm run build
        echo "新的页面压缩完成。"
        echo $SEPARATOR
    done
