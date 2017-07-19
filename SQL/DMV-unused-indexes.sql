-- Find unused indexes using DMVs
SELECT
	OBJECT_NAME(s.object_id) AS TableName,
	i.name AS IndexName,
	i.type_desc AS IndexType,
	user_seeks + user_scans + user_lookups AS TotalUsage,
	user_seeks,
	user_scans,
	user_lookups,
	user_updates
FROM sys.dm_db_index_usage_stats s
RIGHT OUTER JOIN sys.indexes i
	ON s.[object_id] = i.[object_id]
	AND s.index_id = i.index_id
WHERE s.database_id = DB_ID()
	AND i.name IS NOT NULL
	AND OBJECTPROPERTY(s.[object_id], 'IsMsShipped') = 0
ORDER BY s.object_id, s.index_id
