SELECT [Field].[FieldId], [Field].[FieldName], [FieldValue].[FieldValue]
  FROM [Environment].[Field]
  INNER JOIN [Environment].[FieldValue] ON [Field].[FieldId] = [FieldValue].[FieldId]
  ORDER BY FieldName
