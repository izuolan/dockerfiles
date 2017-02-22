#!/bin/sh
SEPARATOR="================================================================"
echo "正在执行初次构建："
echo $SEPARATOR
echo "正在构建并部署页面："
git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_EMAIL"
ssh -o "StrictHostKeyChecking no" -T git@github.com
hexo d -g
# chmod 777 -R /hexo/public
echo "页面已经发布，容器进入监视状态。"
VOLUMES="source themes _config.yml"
INOTIFY_EVENTS="create,delete,modify,move"
INOTIFY_OPTONS="--monitor --exclude=(\.sw[p|x]|\~|\.part)"
inotifywait -rqe ${INOTIFY_EVENTS} ${INOTIFY_OPTONS} ${VOLUMES} | \
    while read -r notifies;
    do
        echo $SEPARATOR
        echo "文件有变动："
        echo "$notifies"
        echo "正在执行重新构建并发布："
        hexo d -g
        # chmod 777 -R /hexo/public
        echo "新的页面构建完成。"
        echo $SEPARATOR
    done
