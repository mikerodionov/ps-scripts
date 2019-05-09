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

SELECT * FROM  #TMPmUserPermissions JOIN Server.ProcSet ON ProcSetID = ProcSetID

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

SELECT [Admin], [Group], [Name], [ServerEvent], [Start], [View], [ViewPart] FROM  #TMPmGroupPermissionsGet JOIN Server.ProcSet ON ProcSetID = ProcSetID
