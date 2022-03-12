SELECT CONVERT (varchar, SERVERPROPERTY('collation')) as 'SQL Server Collation';
SELECT CONVERT (varchar, DATABASEPROPERTYEX('K2','collation')) as 'K2 DB Collation'; 
