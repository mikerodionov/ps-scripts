--Be sure to back up your K2 database before use this script
--Limitation: Only works if form has been checked out, does not work for newly created form which has not been explicitly checked out
--I.e. script will fail if form was created and not checked in
--Tested with: K2 4.6.11
--Adjust K2 database name as necessary on the line below (in case you are using non-default K2 database name)
USE K2
DECLARE @FORM_NAME AS varchar(128)
DECLARE @FORM_ID AS nvarchar(max)
DECLARE @USER AS nvarchar(200)
--Make sure to specify valid form name
--Script will perform check in on behalf of the user who performed checked out
--If necessary you can explicitly specify different user
SET @FORM_NAME = 'Your form name goes here'
SET @USER = (SELECT CheckedOutBy FROM Form.Form_Design WHERE Name=@FORM_NAME) 
IF EXISTS (SELECT ID FROM Form.Form_Design WHERE Name=@FORM_NAME) 
                 AND EXISTS (SELECT Name FROM [Identity].[Identity] WHERE FQN=@USER)
BEGIN
    PRINT 'Specified form name: ' + @FORM_NAME;
	PRINT 'CheckedOutBy value: ' + @USER;
	SET @FORM_ID = (SELECT ID FROM Form.Form_Design WHERE Name=@FORM_NAME)
	EXEC Form.aUndoFormsCheckOut @UserID = @USER, @IDs = @FORM_ID;
	PRINT 'Form ' + @FORM_NAME + ' has been checked out on behalf of ' + @USER;
END
ELSE
	PRINT 'Form: "' + @FORM_NAME + '" does not exist or is not checked out.'
