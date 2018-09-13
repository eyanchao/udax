

#!/bin/bash
#filename: auto_mysql_backup.sh
#describe:auto backup mysql
#author: udax.kr
#date: 2018/8/2

# Database info
DB_USER="root"
DB_PASS="udaxmysql8888"
DB_HOST="localhost"
DB_NAME="mysql"

# Others vars
BIN_DIR="/usr/bin"
BCK_DIR="/backup/mysql"
DATE=`date +%F`

# TODO
# /usr/bin/mysqldump --opt -uroot -pudaxmysql8888 -hlocalhost mysql > /backup/mysql/db_`date +%F`.sql
#$BIN_DIR/mysqldump --opt -u$DB_USER -p$DB_PASS -h$DB_HOST $DB_NAME | gzip > $BCK_DIR/db_$DATE.sql.zip
$BIN_DIR/mysqldump --opt -u$DB_USER -p$DB_PASS -h$DB_HOST $DB_NAME > $BCK_DIR/db_$DATE.sql
