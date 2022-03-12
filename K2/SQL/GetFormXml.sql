--Query to pull FORM XML from K2 DB
--Adjust form name below
DECLARE @FormName nvarchar(max) = 'MyTestForm';
DECLARE @FormID uniqueidentifier;
SELECT @FormID = (SELECT [ID] FROM [K2].[Form].[Form] WHERE [Name] = @FormName);

SELECT *
FROM [Form].[AuditLog]
WHERE Data = CAST(@FormID AS varchar(64)) ORDER BY ID DESC
