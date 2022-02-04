-- When you assign some of your SQL logings to a dbo database user you cannot add this login as a separate user as it is being used by dbo
-- If you then try to use UI to change DBO login or rename DBO user it wont work with error
-- Msg 15150 – Cannot Alter The User ‘dbo’
-- To fix this use script below - that will change dbo login name to sa
USE <database_name>
GO
sp_changedbowner 'sa'
GO
