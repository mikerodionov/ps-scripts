IF (SELECT [Value] FROM [Identity].[CacheConfiguration] WHERE [Name]='ResolvingEnabled') = 'True'
PRINT 'System is running legacy Identity';
ELSE
PRINT 'System is running Sync Service';
