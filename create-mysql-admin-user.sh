#!/bin/bash

mkdir -p /var/run/mysqld
chown mysql:mysql /var/run/mysqld
/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

PASS=it103
echo "=> Creating MySQL admin user with ${PATH} password"
mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY '$PASS'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"
mysql -uadmin -p$PASS -e "CREATE DATABASE it103"
echo "=> Done!"

echo "========================================================================"
echo "A MySQL account has been created with the following informations:"
echo ""
echo "  login: admin"
echo "  password: ${PASS}"
echo ""
echo "A it103 database have been created."
echo "You can manage your database using http://localhost/phpmyadmin"
echo "========================================================================"

mysqladmin -uroot shutdown