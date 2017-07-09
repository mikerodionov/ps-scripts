USE K2
SELECT * FROM sys.indexes
WHERE object_id = (SELECT object_id FROM sys.objects WHERE NAME = 'Identity')
