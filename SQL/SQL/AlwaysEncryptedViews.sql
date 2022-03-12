--Discover AE keys
SELECT * FROM sys.column_master_keys
SELECT * FROM sys.column_encryption_keys
SELECT * FROM sys.column_encryption_key_values
--Discover columns encrypted by AE
SELECT * FROM sys.columns WHERE column_encryption_key_id IS NOT NULL
