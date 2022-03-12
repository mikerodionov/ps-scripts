-- When SQL Server query optimizer opt out not to use index (because of poor index selectivity)
-- but you still want to use it
-- You may use database hint is your query fo rorce use of specific index
-- In realworld production scenarios you should trust query optimizer and avoid using hints,
-- unless sepcifically instructed by MSFT support

SELECT * 
  FROM TableName WITH (Index(IX_TableName_ColumnName)
  WHERE ColumnName = 'Some-value'
    AND Column2Name = 'Some-value'
