FROM registry.scontain.com:5050/sconecuratedimages/apps:mariadb-alpine-scone3.0
RUN rm -rf /var/lib/mysql/* /tmp/* /var/tmp/*
USER mysql
RUN SCONE_MODE=sim MYSQL_ALLOW_EMPTY_PASSWORD="no" MYSQL_RANDOM_ROOT_PASSWORD="no" MYSQL_ROOT_PASSWORD="password" mysql_install_db --datadir=/var/lib/mysql/ --rpm --innodb-use-native-aio=0
ENV MYSQL_ALLOW_EMPTY_PASSWORD="no"
ENV MYSQL_RANDOM_ROOT_PASSWORD="no"
CMD ["mysqld", "--innodb-use-native-aio=0"]
