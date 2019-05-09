DROP TABLE #TMPmUserPermissions
CREATE TABLE #TMPmUserPermissions
(
   ProcSetID INT,
   [User] NVARCHAR(MAX),
   [Admin] BIT,
   [Start] BIT,
   [View] BIT,
   [ViewPart] BIT,
   [ServerEvent] BIT
)
INSERT INTO #TMPmUserPermissions EXEC [Server].mUserPermissionsGet
-- Server level permissions for specific user
SELECT * FROM  #TMPmUserPermissions JOIN Server.ProcSet ON ProcSetID = ProcSetID WHERE User like 'K2:DENALLIX\Bob'

DROP TABLE #TMPmGroupPermissionsGet
CREATE TABLE #TMPmGroupPermissionsGet
(
   [Admin] BIT,
   [Group] NVARCHAR(MAX),
   ProcSetID INT,
   [ServerEvent] INT,
   [Start] BIT,
   [View] BIT,
   [ViewPart] BIT,
)
INSERT INTO #TMPmGroupPermissionsGet EXEC [Server].mGroupPermissionsGet
-- Process level permissions for specific process
SELECT [Admin], [Group], [Name], [ServerEvent], [Start], [View], [ViewPart] FROM  #TMPmGroupPermissionsGet JOIN Server.ProcSet ON ProcSetID = ProcSetID WHERE Name like 'FrameworkGeneric.Workflow.Reference'
