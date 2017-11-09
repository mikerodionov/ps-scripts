DECLARE @tmp varchar(40)
SET @tmp = (SELECT SUBSTRING(CONVERT(varchar(40), NEWID()),0,9))
print @tmp
