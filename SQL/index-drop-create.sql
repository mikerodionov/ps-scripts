-- Create index
-- Note that columns order within index matters - seek is possible on first column only
CREATE INDEX IX_Tablename_Column1Colum2ColumnNNames
  ON TalbeName (Column1, Column2, Column N);
  
-- Create Covering Index - which includes data not participating in index sort
-- these columns added with INCLUDE clause allow you to return data from the index itself
-- without performing key look up operation to find the data row in the table
CREATE INDEX IX_Tablename_ColumnName
  ON TalbeName (ColumnName)
  INCLUDE (Column2Name, Column3Name);

-- Drop index
DROP INDEX IX_Tablename_Column1Colum2ColumnNNames
  ON TableName;
