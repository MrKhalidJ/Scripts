#!/bin/bash

# delete old backup files
rm /home/admin/MyAppBackup/myapp-data.backup.sql
rm /home/admin/MyAppBackup/myapp-files-backup.tar.gz


#Backup database
sudo mysqldump -u root myapp > /home/admin/MyAppBackup/myapp-data.backup.sql


#Backup files
sudo tar -czvf /home/admin/MyAppBackup/myapp-files-backup.tar.gz /var/www/myapp/.env /var/www/myapp/public/uploads /var/www/myapp/storage/uploads


