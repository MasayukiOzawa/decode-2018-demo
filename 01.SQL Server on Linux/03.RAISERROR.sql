/*
syslog のメッセージの表示
tail -f /var/log/syslog | grep "sqlservr" 
*/

-- シングルバイト文字のメッセージの出力
RAISERROR (N'Test Message', 10, 1) WITH LOG

-- ダブルバイト文字のメッセージの出力
RAISERROR (N'テストメッセージ', 10, 1) WITH LOG

-- バックアップエラー時のメッセージの出力
BACKUP DATABASE Dummy

/*
USE [master]
GO
ALTER LOGIN [DemoUser] WITH DEFAULT_DATABASE=[master], 
DEFAULT_LANGUAGE=[English]
GO
*/