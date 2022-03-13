SELECT dq.*,dqu.[User] FROM [Server].[DestQueue] dq LEFT JOIN [Server].[DestQueueUser] dqu ON dqu.QueueID = dq.ID
WHERE dqu.[user] IS NULL