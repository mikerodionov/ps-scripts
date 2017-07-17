# Create index
# Note that columns order within index matters - seek is possible on first column only
CREATE INDEX IX_Tablename_Column1Colum2ColumnNNames
  ON TalbeName (Column1, Column2, Column N);

# Drop index
DROP INDEX IX_Tablename_Column1Colum2ColumnNNames
  ON TableName;
