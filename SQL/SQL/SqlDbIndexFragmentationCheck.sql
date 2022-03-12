#Check SQL DB index fragmentation
#https://gallery.technet.microsoft.com/scriptcenter/Check-SQL-Server-a-a5758043
#Corrective actions:
#https://msdn.microsoft.com/en-us/library/ms189858.aspx
#Rebuild only if page count > than 1000 / If an index has less than 1000 pages and is in memory, don't bother removing fragmentation
#If index is unused, don't bother defragmenting it (sys.dm_db_index_usage_stats)

#> 5% and < = 30% -> ALTER INDEX REORGANIZE
#> 30%	          -> ALTER INDEX REBUILD WITH (ONLINE = ON)

# avg_fragmentation_in_percent - Logical/External fragmentation
# Occurs when the next logical page is not the next physical page
# Prevents optimal readahead -> Reduces range scan performance
# Does not affect pages that are already in cache
# Smaller indexes affected less (e.g. 1-5000 pages or less), as: 
#   - those generally reside in memory
#   - they are not that large, so you are not doing large range-scans on them
# 1000 pages is old guideline, 5000 can be used for modern HW

SELECT OBJECT_NAME(ind.OBJECT_ID) AS TableName, 
ind.name AS IndexName, indexstats.index_type_desc AS IndexType, 
indexstats.avg_fragmentation_in_percent, indexstats.page_count 
FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, NULL) indexstats 
INNER JOIN sys.indexes ind  
ON ind.object_id = indexstats.object_id 
AND ind.index_id = indexstats.index_id 
WHERE indexstats.avg_fragmentation_in_percent > 30 AND indexstats.page_count > 5000
ORDER BY indexstats.avg_fragmentation_in_percent DESC

/*
--Sample index rebuild scripts generator
SELECT 
('ALTER INDEX ' + ind.name + ' ON ' + SCHEMA_NAME(schema_id) + '.' + OBJECT_NAME(ind.OBJECT_ID) + ' REBUILD  WITH (ONLINE = ON)') 
FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, NULL) indexstats 
INNER JOIN sys.indexes ind  
ON ind.object_id = indexstats.object_id 
AND ind.index_id = indexstats.index_id 
INNER JOIN sys.tables sch
ON sch.object_id = indexstats.object_id 
WHERE indexstats.avg_fragmentation_in_percent > 30 AND indexstats.page_count > 5000
*/
