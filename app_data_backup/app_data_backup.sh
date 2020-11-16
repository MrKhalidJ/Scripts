#!/bin/bash

# remove old backup files
rm /home/admin/MyAppBackup/myapp-data.backup.sql
rm /home/admin/MyAppBackup/myapp-files-backup.tar.gz


# backup database
sudo mysqldump -u root myapp > /home/admin/MyAppBackup/myapp-data.backup.sql


# backup files
sudo tar -czvf /home/admin/MyAppBackup/myapp-files-backup.tar.gz /var/www/myapp/.env /var/www/myapp/public/uploads /var/www/myapp/storage/uploads


