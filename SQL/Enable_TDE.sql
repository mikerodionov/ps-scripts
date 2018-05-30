USE master;
GO
IF (select Count(*) from sys.symmetric_keys where name like '%DatabaseMasterKey%') = 0
BEGIN
CREATE MASTER KEY ENCRYPTION BY PASSWORD='P@ssw0rd';
END
GO
IF (select Count(*) from sys.certificates where name = 'TdeCertificate') = 0
BEGIN
CREATE CERTIFICATE TdeCertificate WITH SUBJECT='TDE Certificate'
END
GO

USE [K2];
GO
IF (SELECT Count(*) FROM sys.dm_database_encryption_keys WHERE database_id=(SELECT DB_ID('tempdb'))) = 0
BEGIN
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_128
ENCRYPTION BY SERVER CERTIFICATE TdeCertificate;
END
GO
IF (SELECT is_encrypted FROM master.sys.databases WHERE [name]='K2') = 0
BEGIN
ALTER DATABASE [K2]
SET ENCRYPTION ON;
END
GO
