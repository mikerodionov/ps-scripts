--Be sure to back up your K2 database before use this script
--Warning: If target view has never been checked out (only saved) this view will be lost/deleted after executing this script
--Warning: This stored procedure cancel all changes performed on checked out view - and reverts you to latested checked in version state
--Tested with: K2 4.6.11-5.2
--Adjust K2 database name as necessary on the line below (in case you are using non-default K2 database name)
USE K2
DECLARE @VIEW_NAME AS varchar(128)
DECLARE @VIEW_ID AS nvarchar(max)
DECLARE @USER AS nvarchar(200)
--Make sure to specify valid form name
--Script will perform check in on behalf of the user who performed checked out
--If necessary you can explicitly specify different user
SET @VIEW_NAME = 'TestView'
SET @USER = (SELECT CheckedOutBy FROM Form.View_Design WHERE Name=@VIEW_NAME) 
IF EXISTS (SELECT ID FROM Form.View_Design WHERE Name=@VIEW_NAME) 
                 AND EXISTS (SELECT Name FROM [Identity].[Identity] WHERE FQN=@USER)
BEGIN
    PRINT 'Specified form name: ' + @VIEW_NAME;
	PRINT 'CheckedOutBy value: ' + @USER;
	SET @VIEW_ID = (SELECT ID FROM Form.View_Design WHERE Name=@VIEW_NAME)
	EXEC Form.aUndoViewsCheckOut @UserID = @USER, @IDs = @VIEW_ID;
	PRINT 'View ' + @VIEW_NAME + ' has been checked out on behalf of ' + @USER;
END
ELSE
	PRINT 'View: "' + @VIEW_NAME + '" does not exist or is not checked out.'
