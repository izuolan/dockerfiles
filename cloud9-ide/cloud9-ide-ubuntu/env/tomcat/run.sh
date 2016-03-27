#!/bin/bash

TOMCAT_MAJOR_VERSION="8"
TOMCAT_MINOR_VERSION="8.0.11"
CATALINA_HOME="/tomcat"

if [ ! -f /.tomcat_admin_created ]; then
    ./create_tomcat_admin_user.sh
fi