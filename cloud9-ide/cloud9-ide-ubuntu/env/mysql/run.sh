#!/bin/bash

set -m
set -e

CONF_FILE="/etc/mysql/conf.d/my.cnf"
LOG="/var/log/mysql/error.log"
MYSQL_USER=admin
MYSQL_PASS=**Random**

# read -p "请输入MySQL的root密码：" ROOT_PASS

# 设置配置文件的权限
chmod 644 ${CONF_FILE}
chmod 644 /etc/mysql/conf.d/mysqld_charset.cnf

StartMySQL ()
{
    /usr/bin/mysqld_safe ${EXTRA_OPTS} > /dev/null 2>&1 &
    # 设置超时为1分钟
    LOOP_LIMIT=60
    for (( i=0 ; ; i++ )); do
        if [ ${i} -eq ${LOOP_LIMIT} ]; then
            echo "超时。下面显示的是错误日志:"
            tail -n 100 ${LOG}
            exit 1
        fi
        echo "=> 等待确认MySQL服务启动，trying ${i}/${LOOP_LIMIT} ..."
        sleep 1
        mysql -uroot -p -e "status" > /dev/null 2>&1 && break
    done
}

CreateMySQLUser()
{
    if [ "$MYSQL_PASS" = "**Random**" ]; then
        unset MYSQL_PASS
    fi
    # 手动生成密码
    read -p "请输入MySQL的密码（直接回车则自动生成密码）：" MYSQL_PASS
    # 自动生成密码
    PASS=${MYSQL_PASS:-$(pwgen -s 12 1)}
    _word=$( [ ${MYSQL_PASS} ] && echo "刚才设定的密码" || echo "自动生成的密码" )
    echo "=> 正在创建MySQL用户${MYSQL_USER}，密码为${_word}"

    mysql -uroot -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '$PASS'"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION"
    echo "=> 完成！！"
    echo "========================================================================"
    echo "你现在可以连接MySQL服务了："
    echo ""
    echo "    mysql -u$MYSQL_USER -p$PASS -h<host> -P<port>"
    echo ""
    echo "如果你是自动生成密码，请记住尽快更改上述密码！！"
    echo "MySQL的'root'用户只允许本地连接。"
    echo "========================================================================"
}

echo "=> 正在启动MySQL ..."
StartMySQL
tail -F $LOG &

# 创建admin用户
if [ -f /var/lib/mysql/.EMPTY_DB ]; then
    echo "=> 正在创建admin用户 ..."
    CreateMySQLUser
    rm /var/lib/mysql/.EMPTY_DB
fi