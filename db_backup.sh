#!/bin/sh

filesize=$(stat -c%s /home/cPanel帳號/public_html/backup/full_backup_`date -I`.sql) # 要檢查的備份檔位置
while [ 1000 -gt $(($filesize)) ] # 如果檔案小於 1000，代表備份失敗，進入迴圈再次進行備份
do
    /usr/bin/mysqldump --user=cPanel帳號 --password=cPanel密碼 --all-databases --single-transaction > /home/cPanel帳號/public_html/backup/full_backup_`date -I`.sql # 再次進行備份
    filesize=$(stat -c%s /home/cPanel帳號/public_html/backup/full_backup_`date -I`.sql) # 重新選取要被檢查的備份檔，並進入迴圈進行檢查，直到檔案大小大於 1000
done