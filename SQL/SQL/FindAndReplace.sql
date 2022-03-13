/*
Author: sqiller
Description: Searches for a value to replace in all columns from all tables
USE: EXEC dbo.usp_Update_AllTAbles 'work', 'sqiller', 1
@search = Value to look for Replace
@newvalue = the value that will replace @search
@Test = If set to 1, it will only PRINT the UPDATE statement instead of EXEC, useful to see
        what is going to update before.
*/

CREATE PROCEDURE dbo.usp_Update_AllTAbles(
@search varchar(100),
@newvalue varchar(100),
@Test bit)
AS
BEGIN

            IF NOT EXISTS (select 1 from INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Tables_to_Update')
            BEGIN
                    CREATE TABLE dbo.Tables_to_Update(
                    Table_name varchar(100),
                    Column_name varchar(100),
                    recordsToUpdate int
                    )
            END
            DECLARE @table varchar(100)
            DECLARE @column varchar(100)
            DECLARE @SQL varchar(max)

            SELECT TABLE_SCHEMA+'.'+TABLE_NAME as Table_Name, 0 as Processed INTO #tables from information_schema.tables WHERE TABLE_TYPE != 'VIEW'

            WHILE EXISTS (select * from #tables where processed = 0)
            BEGIN
                SELECT top 1 @table = table_name from #tables where processed = 0

                SELECT column_name, 0 as Processed INTO #columns from information_schema.columns where TABLE_SCHEMA+'.'+TABLE_NAME = @table


                WHILE EXISTS (SELECT * from #columns where processed = 0)
                BEGIN
                    SELECT top 1 @column = COLUMN_NAME from #columns where processed = 0

                    SET @SQL = 'INSERT INTO Tables_to_Update
                                select '''+ @table +''', '''+ @column +''', count(*) from '+@table+ ' where '+ @column +' like ''%'+ @search +'%'''
                    EXEC(@SQL)

                    IF EXISTS (SELECT * FROM Tables_to_Update WHERE Table_name = @table)
                    BEGIN
                        SET @SQL = 'UPDATE '+ @table + ' SET '+ @column + ' = REPLACE('''+@column+''','''+@search+''','''+ @newvalue +''')  WHERE '+ @column + ' like ''%'+@search+'%'''
                        --UPDATE HERE
                        IF (@Test = 1)
                        BEGIN   
                            PRINT @SQL
                        END
                        ELSE
                        BEGIN
                            EXEC(@SQL)
                        END
                    END

                    UPDATE #columns SET Processed = 1 where COLUMN_NAME = @column
                END

                DROP TABLE #columns

                UPDATE #tables SET Processed = 1 where table_name = @table
            END

            SELECT * FROM Tables_to_Update where recordsToUpdate > 0

END