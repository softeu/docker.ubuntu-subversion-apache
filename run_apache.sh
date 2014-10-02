#!/bin/bash


set |grep '_PORT_' |tr  '=' ' ' |sed 's/^/SetEnv /' > /etc/apache2/conf-enabled/docker-vars.conf
set |grep '_ENV_' |tr  '=' ' ' |sed 's/^/SetEnv /' >> /etc/apache2/conf-enabled/docker-vars.conf
set |grep LDAP | tr '=' ' ' | sed 's/^/SetEnv /' >> /etc/apache2/conf-enabled/docker-vars.conf
#echo "PassEnv LDAP_PORT LDAP_HOST " >> /etc/apache2/conf-enabled/docker-vars.conf

set |grep LDAP |sed 's/^/export /' >> /etc/apache2/envvars

/etc/init.d/apache2 start && \
tail -F /var/log/apache2/*log

#service rsyslog start && \
#service postfix start && \
#tail -F /var/log/mail.log
