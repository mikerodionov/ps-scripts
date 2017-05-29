USE K2
SELECT COUNT(*) FROM [Identity].[Identity]
WHERE [Enabled]=1 AND ExpireOn <= DATEADD(DAY, -30, GETDATE())
