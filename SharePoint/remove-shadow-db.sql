--Check if reference to DB exist
SELECT * FROM Objects WHERE name='SP2013_AppManagementSvc';
--Drop DB reference if necessary
DELETE FROM Objects WHERE name='SP2013_AppManagementSvc';
