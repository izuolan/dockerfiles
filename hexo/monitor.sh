#!/bin/sh
SEPARATOR="================================================================"
echo "正在执行初次构建："
echo $SEPARATOR
hexo g
chmod 777 -R /hexo/public
echo -e "\n\n"
echo "页面构建完成，正在发布到 Github："
echo $SEPARATOR
ssh -o "StrictHostKeyChecking no" -T git@github.com
hexo d
echo -e "\n\n"
echo "页面已经发布，容器进入监视状态。"
VOLUMES="source themes _config.yml"
INOTIFY_EVENTS="create,delete,modify,move"
INOTIFY_OPTONS="--monitor --exclude=(\.sw[p|x]|\~)"
inotifywait -rqe ${INOTIFY_EVENTS} ${INOTIFY_OPTONS} ${VOLUMES} | \
    while read -r notifies;
    do
    	echo -e "\n\n"
        echo $SEPARATOR
        echo "文件有变动："
        echo "$notifies"
        echo -e "\n\n"
        echo "正在执行重新构建并发布："
        echo $SEPARATOR
        hexo d -g
        chmod 777 -R /hexo/public
        echo -e "\n\n"
        echo "新的页面构建完成。"
        echo $SEPARATOR
    done
