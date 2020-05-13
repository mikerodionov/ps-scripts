-- The sys.event_log view offers information about individual events, which includes some that can cause transient errors or connectivity failures.
-- Ideally, you can correlate the start_time or end_time values with information about when your client program experienced problems.
-- You must connect to the master database to run this query.

SELECT e.*
FROM sys.event_log AS e
WHERE e.database_name = 'myDbName'
AND e.event_category = 'connectivity'
AND 2 >= DateDiff
  (hour, e.end_time, GetUtcDate())
ORDER BY e.event_category,
  e.event_type, e.end_time;
  
-- The sys.database_connection_stats view offers aggregated counts of event types for additional diagnostics.

-- You must connect to the master database to run this query.

SELECT c.*
FROM sys.database_connection_stats AS c
WHERE c.database_name = 'myDbName'
AND 24 >= DateDiff
  (hour, c.end_time, GetUtcDate())
ORDER BY c.end_time;
