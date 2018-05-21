USE [master]
GO

-- バックアップファイルからバージョンを確認
RESTORE HEADERONLY FROM  DISK = N'/mnt/share/backup/pubs.bak' 
-- RESTORE FILELISTONLY FROM  DISK = N'/mnt/share/backup/pubs.bak' 
GO

/*
SQL Server 2005 : 611
SQL Server 2008 : 661
SQL Server 2008 R2 : 665
*/

-- SQL Server on Linux に Windows の SQL Server の DB をリストア
ALTER DATABASE [pubs] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

RESTORE DATABASE [pubs] FROM  DISK = N'/mnt/share/backup/pubs.bak' 
WITH  FILE = 1,  
MOVE N'pubs' TO N'/var/opt/mssql/data/pubs.mdf',  
MOVE N'pubs_log' TO N'/var/opt/mssql/data/pubs_log.ldf',  
NOUNLOAD,  REPLACE,  STATS = 5
GO

ALTER DATABASE [pubs] SET MULTI_USER
GO
