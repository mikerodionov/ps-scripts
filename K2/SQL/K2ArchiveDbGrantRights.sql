DECLARE @YEAR AS INT
SET @YEAR=2012
DECLARE @DBNAME VARCHAR(255)
WHILE(@YEAR<=2017)
    BEGIN
	SET @DBNAME = 'K2Archive' + CAST(@YEAR AS VARCHAR(4))
	declare @sql nvarchar(255);
	set @sql = 'USE ' + @DBNAME + ';
	exec sp_addrolemember db_owner, ''DENALLIX\K2Service'';
	exec sp_addrolemember db_owner, ''DENALLIX\K2WebService'';';
	EXEC (@sql)
	SET @YEAR = @YEAR+1;
    END
