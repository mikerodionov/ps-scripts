--Server collation and language:
SELECT CONVERT (varchar, SERVERPROPERTY('collation')) AS "Server Collation", @@language AS "Server Language"

--Server language:
SELECT * 
FROM sys.syslanguages 
WHERE langid=@@langid

--List of all databases with collations:
SELECT Databases.* 
FROM Sys.Databases

--Analysis of columns
SELECT OBJECT_SCHEMA_NAME(T.[object_id],DB_ID()) AS [Schema], 
T.[name] AS [table_name], AC.[name] AS [column_name], 
TY.[name] AS system_data_type, AC.[max_length], 
AC.[precision], AC.[scale], AC.[is_nullable], AC.[is_ansi_padded],AC.Collation_name
FROM sys.[tables] AS T 
INNER JOIN sys.[all_columns] AC ON T.[object_id] = AC.[object_id] 
INNER JOIN sys.[types] TY ON AC.[system_type_id] = TY.[system_type_id] AND AC.[user_type_id] = TY.[user_type_id] 
WHERE T.[is_ms_shipped] = 0 
