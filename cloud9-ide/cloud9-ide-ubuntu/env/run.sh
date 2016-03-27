#!/bin/bash
if [ ${UID} == 0 ]; then
    echo "1. 基础软件包"
    echo "2. Nodejs"
    echo "3. Python"
    echo "4. Golang"
    echo "5. Java"
    echo "6. PHP+Apache"
    echo "7. Tomcat"
    echo "8. MySQL"
    echo "第一次执行请安装基础软件包，然后选择其他操作。"
    read -p "选择你要安装的开发环境（输入前面的数字）：" i
    case "$i" in
        1)
        echo "1. curl"
        echo "2. ca-certificates"
        echo "3. wget"
        echo "4. "
        read -p "选择操作（推荐直接回车安装全部）：" i
        case "$i" in
            1)
            apt-get update && \
            DEBIAN_FRONTEND=noninteractive apt-get -yq install \
            curl
            echo "========================================================================"
            echo "curl安装完成！！"
            echo "========================================================================"
            ;;
            2)
            apt-get update && \
            DEBIAN_FRONTEND=noninteractive apt-get -yq install \
            ca-certificates
            echo "========================================================================"
            echo "ca-certificates安装完成！！"
            echo "========================================================================"
            ;;
            1)
            apt-get update && \
            DEBIAN_FRONTEND=noninteractive apt-get -yq install \
            wget
            echo "========================================================================"
            echo "wget安装完成！！"
            echo "========================================================================"
            ;;
            4)
            apt-get update && \
            DEBIAN_FRONTEND=noninteractive apt-get -yq install --no-install-recommends \
            pwgen
            echo "========================================================================"
            echo "pwgen安装完成！！"
            echo "========================================================================"
            ;;
            *)
            apt-get update && \
            DEBIAN_FRONTEND=noninteractive apt-get -yq install \
            curl \
            ca-certificates \
            wget \
            pwgen \
            echo "========================================================================"
            echo "基础软件包已全部安装完成！！"
            echo "========================================================================"
        esac
        ;;
        2)
        curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
        sudo apt-get install -y nodejs
        node -v
        echo "========================================================================"
        echo "Nodejs安装完成！！"
        echo "========================================================================"
        ;;
	    3)
    	apt-get install python
    	python -v
    	echo "========================================================================"
        echo "Python安装完成！！"
        echo "========================================================================"
    	;;
    	4)
    	bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    	gvm install go1.4.2
        gvm use go1.4.2
        go -v
        echo "========================================================================"
        echo "Golang安装完成！！"
        echo "========================================================================"
    	;;
    	5)
    	apt-get install python-software-properties software-properties-common
    	add-apt-repository ppa:webupd8team/java && sudo apt-get update
        apt-get install oracle-java8-installer
        java -version
        echo "========================================================================"
        echo "Java安装完成！！"
        echo "========================================================================"
    	;;
    	6)
        DEBIAN_FRONTEND=noninteractive apt-get -yq install \
            apache2 \
            libapache2-mod-php5 \
            php5-mysql \
            php5-mcrypt \
            php5-gd \
            php5-curl \
            php-pear \
            php-apc
        curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
        /usr/sbin/php5enmod mcrypt
        echo "========================================================================"
        echo "PHP安装完成！！"
        echo "========================================================================"
        echo "ServerName localhost" >> /etc/apache2/apache2.conf
        sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini
        mkdir -p /workspace/php && rm -fr /var/www/html && ln -s /workspace/php /var/www/html
        chown www-data:www-data /workspace/php -R
        sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
        a2enmod rewrite
        source /etc/apache2/envvars
        tail -F /var/log/apache2/* &
        exec apache2 -D FOREGROUND
        echo "========================================================================"
        echo "PHP安装完成！！Apache已经启动，public目录为workspace/php！！"
        echo "========================================================================"
    	;;
    	7)
    	TOMCAT_MAJOR_VERSION="8"
        TOMCAT_MINOR_VERSION="8.0.11"
        CATALINA_HOME="/tomcat"
    	wget -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
        wget -qO- https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
        tar zxf apache-tomcat-*.tar.gz && \
        rm apache-tomcat-*.tar.gz && \
        mv apache-tomcat* $CATALINA_HOME
        chmod +x $(pwd)/tomcat/*.sh && \
        .$(pwd)/tomcat/run.sh
    	;;
    	8)
    	mv $(pwd)/mysql/my.cnf /etc/mysql/conf.d/my.cnf
        mv $(pwd)/mysql/mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf
        apt-get -yq install mysql-server-5.6 && \
        rm -rf /var/lib/apt/lists/* && \
        rm /etc/mysql/conf.d/mysqld_safe_syslog.cnf && \
        if [ ! -f /usr/share/mysql/my-default.cnf ] ; then cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf; fi && \
        mysql_install_db > /dev/null 2>&1 && \
        touch /var/lib/mysql/.EMPTY_DB
        .$(pwd)/mysql/run.sh
    	;;
        *)
        echo "选一个正确的数字～～"
    esac
else
    echo "没有权限（是不是少了sudo？）～～"
fi