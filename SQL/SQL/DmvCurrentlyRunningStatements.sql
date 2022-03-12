-- List statements which are running at the moment
-- Check for slow query blocking other things - watch out for DurationInSeconds and resoucrces usage
SELECT
        [DatabaseName] = db_name(rq.database_id),
        s.session_id, 
        rq.status,
        [SqlStatement] = SUBSTRING (qt.text,rq.statement_start_offset/2,
            (CASE WHEN rq.statement_end_offset = -1 THEN LEN(CONVERT(NVARCHAR(MAX),
            qt.text)) * 2 ELSE rq.statement_end_offset END - rq.statement_start_offset)/2),        
        [ClientHost] = s.host_name,
        [ClientProgram] = s.program_name, 
        [ClientProcessId] = s.host_process_id, 
        [SqlLoginUser] = s.login_name,
        [DurationInSeconds] = datediff(s,rq.start_time,getdate()),
        rq.start_time,
        rq.cpu_time,
        rq.logical_reads,
        rq.writes,
        [ParentStatement] = qt.text,
        p.query_plan,
        rq.wait_type,
        [BlockingSessionId] = bs.session_id,
        [BlockingHostname] = bs.host_name,
        [BlockingProgram] = bs.program_name,
        [BlockingClientProcessId] = bs.host_process_id,
        [BlockingSql] = SUBSTRING (bt.text, brq.statement_start_offset/2,
            (CASE WHEN brq.statement_end_offset = -1 THEN LEN(CONVERT(NVARCHAR(MAX),
            bt.text)) * 2 ELSE brq.statement_end_offset END - brq.statement_start_offset)/2)
    FROM sys.dm_exec_sessions s
    INNER JOIN sys.dm_exec_requests rq
        ON s.session_id = rq.session_id
    CROSS APPLY sys.dm_exec_sql_text(rq.sql_handle) as qt
    OUTER APPLY sys.dm_exec_query_plan(rq.plan_handle) p
    LEFT OUTER JOIN sys.dm_exec_sessions bs
        ON rq.blocking_session_id = bs.session_id
    LEFT OUTER JOIN sys.dm_exec_requests brq
        ON rq.blocking_session_id = brq.session_id
    OUTER APPLY sys.dm_exec_sql_text(brq.sql_handle) as bt
    WHERE s.is_user_process =1
        AND s.session_id <> @@spid
 AND rq.database_id = DB_ID()  -- Comment out to look at all databases
    ORDER BY rq.start_time ASC;
