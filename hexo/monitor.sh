#!/bin/sh
SEPARATOR="================================================================"
echo "正在执行初次构建："
echo $SEPARATOR
if [ "$COMPRESS" = "true" ]; then
    echo "正在压缩图片和中文字体："
    chroot /host_dir docker run --rm -v $HEXO/themes:/html -v $HEXO/source:/images zuolan/font-spider
fi
echo "正在构建并部署页面："
ssh -o "StrictHostKeyChecking no" -T git@github.com
hexo d -g
chmod 777 -R /hexo/public
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
        echo $SEPARATOR
        if [ "$COMPRESS" = "true" ]; then
            echo "正在压缩图片和中文字体："
            chroot /host_dir docker run --rm -v $HEXO/themes:/html -v $HEXO/source:/images zuolan/font-spider
        fi
        echo "正在构建并部署页面："
        hexo d -g
        chmod 777 -R /hexo/public
        echo "新的页面构建完成。"
        echo $SEPARATOR
    done
