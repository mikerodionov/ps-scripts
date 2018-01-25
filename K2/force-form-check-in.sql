USE K2
SELECT * FROM Form.Form_Design WHERE Name='%FORM_NAME%'
-- Copy ID and CheckedOutBy values from the output to reuse as a parameters below

DECLARE @myvar AS uniqueidentifier
--Replace value below with value of ID
--That conversion required sometimes
set @myvar = '125083A3-1090-4AAB-BAC3-920A6446AC26'
--Replace @UserID value with one from CheckedOutBy or another:
EXEC Form.aUndoFormsCheckOut @UserID = 'K2:DOMAIN\user', @IDs = @myvar;
-- Replace 'UserName' with actual username
-- Replace ID with actual Form ID
