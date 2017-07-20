-- List server side traces
SELECT * FROM sys.fn_trace_getinfo(0);

-- List server side traces (user-friendly form):
SELECT
  traceid AS TraceId,
  max(case when property = 2 then value end) AS TraceFile,
  max(case when property = 3 then value end) AS MaxSize,
  max(case when property = 4 then value end) AS StopTime,
  max(case when property = 5 then
    case value
      when 1 then 'Running'
      when 0 then 'Stopped'
    end
  end) AS CurrentStatus
FROM sys.fn_trace_getinfo(0)
GROUP BY traceid;

-- Stop Trace
exec sp_trace_setstatus @TraceID, 0

-- (Re)start the trace
exec sp_trace_setstatus @TraceID, 1

-- Remove the trace definition from SQL Server
exec sp_trace_setstatus @TraceID, 2
