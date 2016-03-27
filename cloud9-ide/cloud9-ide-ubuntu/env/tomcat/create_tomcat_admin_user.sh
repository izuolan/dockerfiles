#!/bin/bash

TOMCAT_MAJOR_VERSION="8"
TOMCAT_MINOR_VERSION="8.0.11"
CATALINA_HOME="/tomcat"

if [ -f /.tomcat_admin_created ]; then
    echo "Tomcat 'admin' 已经创建！！"
    exit 0
fi

# 手动生成密码
read -p "请输入admin的密码（直接回车则自动生成密码）：" TOMCAT_PASS

# 自动生成密码
PASS=${TOMCAT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${TOMCAT_PASS} ] && echo "刚才设定的密码" || echo "自动生成的密码" )

echo "=> Tomcat正在创建admin用户，密码为${_word}。"
sed -i -r 's/<\/tomcat-users>//' ${CATALINA_HOME}/conf/tomcat-users.xml
echo '<role rolename="manager-gui"/>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo '<role rolename="manager-script"/>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo '<role rolename="manager-jmx"/>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo '<role rolename="admin-gui"/>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo '<role rolename="admin-script"/>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo "<user username=\"admin\" password=\"${PASS}\" roles=\"manager-gui,manager-script,manager-jmx,admin-gui, admin-script\"/>" >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo '</tomcat-users>' >> ${CATALINA_HOME}/conf/tomcat-users.xml 
echo "=> 完成！！"
touch /.tomcat_admin_created

echo "========================================================================"
echo "现在您可以使用下面账号配置Tomcat服务器："
echo ""
echo "    admin:${PASS}"
echo ""
echo "启动Tomcat：${CATALINA_HOME}/bin/catalina.sh run"
echo "========================================================================"