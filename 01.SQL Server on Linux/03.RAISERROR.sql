tail -f /var/log/syslog | grep "sqlservr" 

RAISERROR ('Test Message', 10, 1) WITH LOG
RAISERROR ('テストメッセージ', 10, 1) WITH LOG
BACKUP DATABASE Dummy
