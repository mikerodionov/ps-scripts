DECLARE @NAME VARCHAR(256);
DECLARE @ID INT;
DECLARE @CUSTOMEVENTID INT;
SET @NAME = 'Test 1'
SET @ID = (SELECT ID FROM [K2].[Eventbus].[Schedule] WHERE Name =  @NAME)
SET @CUSTOMEVENTID = (SELECT ID FROM [K2].[Eventbus].[CustomEvent] WHERE Name = @NAME)

DELETE FROM [K2].[Eventbus].[EventPolicyMapping] WHERE CustomEventID=@CUSTOMEVENTID
DELETE FROM [K2].[Eventbus].[CustomEvent] WHERE ID=@CUSTOMEVENTID
DELETE FROM [K2].[Eventbus].[CustomEventInstance] WHERE ID=@CUSTOMEVENTID
DELETE FROM [K2].[Eventbus].[ScheduleInstance] WHERE ID = @ID
DELETE FROM [K2].[Eventbus].[Schedule] WHERE ID = @ID
