-- mArchive_v1.5.4 for K2 4.7 / mArchive_v1.6 for K2 Five
USE [K2]
GO

DECLARE @return_value int

EXEC @return_value = [dbo].[mArchive]
@logDB = N'K2',
@arcDB = N'ArchiveDB',
@FromDate = N'1/1/2017 12:00:000 AM',
@ToDate = N'12/31/2017 12:00:000 AM',
@RunInTransaction = 1,
@ShrinkK2LogDBLog = 0,
@ShrinkK2ArchiveDBLog = 0,
@ShrinkK2LogDBLogAtEnd = 0,
@ShrinkK2ArchiveDBLogAtEnd = 0

SELECT 'Return Value' = @return_value

GO
