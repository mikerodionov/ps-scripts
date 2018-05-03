--This script shows default DB collation + all tables and columns with collation other than default one
--Adjust target DB name as necessary
USE K2

DECLARE @DatabaseCollation VARCHAR(100)

SELECT 
    @DatabaseCollation = collation_name 
FROM 
    sys.databases
WHERE 
    database_id = DB_ID()

SELECT 
    @DatabaseCollation 'Default database collation'

SELECT 
    t.Name 'Table Name',
    c.name 'Col Name',
    ty.name 'Type Name',
    c.max_length,
    c.collation_name,
    c.is_nullable
FROM 
    sys.columns c 
INNER JOIN 
    sys.tables t ON c.object_id = t.object_id
INNER JOIN 
    sys.types ty ON c.system_type_id = ty.system_type_id    
WHERE 
    t.is_ms_shipped = 0
    AND 
    c.collation_name <> @DatabaseCollation
