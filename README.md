# mysql-auto-backup

腳本用於檢查備份資料庫的檔案大小是否過小，若過小則表示沒有備份成功；則會自動重新備份。

> 我個人是使用在有 cPanel 控制台的虛擬主機上，還沒有適用在其它非 cPanel 控制台上；以下皆以我在 cPanel 的使用流程為示範。

1. 新增一個備份 MySQL 的排程指令，並設定每日定時執行。

```
/usr/bin/mysqldump --user=帳號 --password=密碼 --all-databases --single-transaction > /home/帳號/public_html/backup/full_backup_`date -I`.sql
```

2. 再新增一個排程指令，執行「db_backup.sh」，用來檢查檔案大小是否正常。

```
/bin/sh /home/cPanel帳號/public_html/backup/db_backup.sh	
```

PS：任何路徑都可視個人情況進行修改，能互相連上就好。

Blog Article: [撰寫 Shell 指令，每日自動備份資料庫 - 使用 cPanel Cron Job
](https://guiblogs.com/shell-backup/)