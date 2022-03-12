-- ALTER DATABASE (Azure SQL Database) SET ENCRYPTION ON/OFF encrypts or decrypts a database
ALTER DATABASE SET ENCRYPTION ON
-- Returns information about the encryption state of a database and its associated database encryption keys:
sys.dm_database_encryption_keys
-- Returns information about the encryption state of each data warehouse node and its associated database encryption keys:
sys.dm_pdw_nodes_database_encryption_keys	
