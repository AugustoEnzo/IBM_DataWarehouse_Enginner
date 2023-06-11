mysqldump --all-databases --user=root --password=MTk3OTQtZW56b2F1 > all-databases-backup.sql
mkdir /tmp/$(date +%Y%m%d)
mv all-databases-backup.sql /tmp/$(date +%Y%m%d)