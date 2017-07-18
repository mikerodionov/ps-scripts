# You can use this script to check if ActionerName has spaces in the beginnig or in the end
USE K2
SELECT ActionerName
FROM Server.Actioner
WHERE DATALENGTH(RTRIM(LTRIM(ActionerName))) <> DATALENGTH(ActionerName)
