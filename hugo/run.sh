#!/bin/sh
SEPARATOR="================================================================"
echo "正在执行初次构建："
echo $SEPARATOR
echo "正在构建页面："
hugo
echo "页面已经发布，容器进入监视状态。"
VOLUMES="/hugo"
INOTIFY_EVENTS="create,delete,modify,move"
INOTIFY_OPTONS="--monitor --exclude=public"
inotifywait -rqe ${INOTIFY_EVENTS} ${INOTIFY_OPTONS} ${VOLUMES} | \
    while read -r notifies;
    do
        echo $SEPARATOR
        echo "文件有变动："
        echo "$notifies"
        echo "正在重新构建页面："
        hugo
        echo "新的页面构建完成。"
        echo $SEPARATOR
    done
