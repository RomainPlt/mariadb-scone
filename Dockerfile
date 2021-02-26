FROM registry.scontain.com:5050/sconecuratedimages/apps:mariadb-alpine-scone3.0
RUN rm -rf /var/lib/mysql/* /tmp/* /var/tmp/* \
&& su mysql \
&& unset SCONE_CONFIG_ID \
&& SCONE_MODE=sim MYSQL_ALLOW_EMPTY_PASSWORD="no" MYSQL_RANDOM_ROOT_PASSWORD="no" MYSQL_ROOT_PASSWORD="password" mysql_install_db --datadir=/var/lib/mysql/ --rpm --innodb-use-native-aio=0
USER mysql
CMD ["mysqld", "--innodb-use-native-aio=0"]
