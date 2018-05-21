-- DMV の情報を確認
SELECT * FROM sys.dm_os_performance_counters
GO

-- DMV の情報を格納したテーブルのデータを SQLOps で可視化
SELECT 
	perf_date,
	cntr_value / 1024 AS DataCache_MB
FROM  
	tempdb..perf 
WHERE 
	perf_date BETWEEN  DATEADD(mi, -30, GETDATE()) AND GETDATE()
	AND
	counter_name = 'Database Cache Memory (KB)'