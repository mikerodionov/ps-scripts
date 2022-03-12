DECLARE @YEAR AS INT
SET @YEAR=2012
DECLARE @DBNAME VARCHAR(255)
WHILE(@YEAR<=2017)
    BEGIN
	SET @DBNAME = 'K2Archive' + CAST(@YEAR AS VARCHAR(4))
    
	DECLARE @DBFileName nvarchar(max);
	SET @DBFileName = N'F:\' + @DBName + '.mdf';
	DECLARE @DBLogName nvarchar(max);
	SET @DBLogName = N'F:\' + @DBName + '.ldf';
	DECLARE @SQL nvarchar(max);
	SET @SQL = N'CREATE DATABASE [' + @DBNAME + '] ON PRIMARY (NAME = ' + @DBNAME + '_Data, FILENAME = ''' + @DBFileName+ ''' , SIZE = 2048MB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%) LOG ON ( NAME = ' + @DBNAME + '_Log, FILENAME = ''' + @DBLogName + ''', SIZE = 2048MB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)'
	PRINT @SQL
	EXEC (@SQL)
	
	SET @YEAR = @YEAR+1;
    END
