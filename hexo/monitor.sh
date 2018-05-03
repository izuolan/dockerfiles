#!/bin/sh
if [ ! -f "/hexo/_config.yml" ]; then
  echo "Monitor: _config.yml not found, runing hexo init"
  hexo init .
  yarn add hexo-deployer-git hexo-deployer-shell hexo-neat
  yarn install
fi
SEPARATOR="================================================================"
echo "正在执行初次构建："
echo $SEPARATOR
echo "正在构建并部署页面："
npm install hexo --save
git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_EMAIL"
ssh -o "StrictHostKeyChecking no" -T git@github.com
hexo d -g
# chmod 777 -R /hexo/public
echo "页面已经发布，容器进入监视状态。"
while true; do
  find _config.yml source themes | entr sh -c 'hexo d -g'
done
