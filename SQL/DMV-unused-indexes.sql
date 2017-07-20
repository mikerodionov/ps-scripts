-- Find unused indexes using DMVs
-- Compare user_seeks with user_updates, if index has more seeks than updates then good
-- Lots of user_updated but no user_seeks means index not being used but incur maintenance cost
-- This possibly means that index has to be dropped
-- NOTE: To use DMV user has to have VIEW SERVER STATE privilege, if granting this right is not an 
-- option, then your DBA may create specific views you need and grant rights to them
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
