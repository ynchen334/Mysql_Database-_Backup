#!/bin/bash

BACKUP=/data/backup/db
DATETIME=$(date+%Y-%m-%d_%H%M%S)
HOST=localhost
DB_USER=root
DB_PW=${MYSQL_PWD}
DATABASE=animals

# current time
echo $DATETIME

# create backup directory if not exist
[ ! -d "${BACKUP}/${DATETIME}" ] && mkdir -p "${BACKUP}/${DATATIME}"

# backup datebase
mysqldump -u ${DB_USER} -p ${DB_PW} --host=${HOST} -q -R --databases ${DATABASE} | gzip > ${BACKUP}/${DATETIME}/$DATETIME.sql.gz

# compress files into tar.gz format
cd ${BACKUP}
tar -zcvf $DATETIME.tar.gz ${DATETIME}
rm -rf ${BACKUP}/${DATETIME}
echo "Backup database ${DATABASE} succeeded"

# delete backup files older than 10 days
find ${BACKUP} -mtime +10 -name "*.tar.gz" -exec rm -rf {} \;


