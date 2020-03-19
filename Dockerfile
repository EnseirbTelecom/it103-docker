FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive
ENV PHP_UPLOAD_MAX_FILESIZE 10M
ENV PHP_POST_MAX_SIZE 10M

RUN apt-get update && \
  apt-get -y install supervisor wget unzip git apache2 libapache2-mod-php mysql-server php-mysql && \
  echo "ServerName localhost" >> /etc/apache2/apache2.conf

ADD start-apache2.sh /start-apache2.sh
ADD start-mysqld.sh /start-mysqld.sh
ADD create-mysql-admin-user.sh /create-mysql-admin-user.sh
ADD run.sh /run.sh
ADD my.cnf /etc/mysql/conf.d/my.cnf
RUN chmod 755 /*.sh

ADD supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf
ADD supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf

RUN rm -rf /var/lib/mysql/*
RUN mkdir -p /var/www/html/it103
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.zip && \
  unzip phpMyAdmin-5.0.1-all-languages.zip -d /var/www/html && \
  mv /var/www/html/phpMyAdmin-5.0.1-all-languages /var/www/html/phpmyadmin
RUN mkdir /var/www/html/info
ADD phpinfo.php /var/www/html/info/index.php

EXPOSE 80 3306

VOLUME ["/etc/mysql", "/var/lib/mysql", "/var/www/html/it103"]

CMD ["/run.sh"]