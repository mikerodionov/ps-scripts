---View waits data since service startup/DMV clear up:
SELECT * FROM sys.dm_os_wait_stats

---Clear DMV:
DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR)
