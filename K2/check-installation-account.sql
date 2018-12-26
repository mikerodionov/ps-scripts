-- Use this script to confirm whether setup was run using K2 service account
SELECT *
FROM [HostServer].[Configuration]
where VariableToken LIKE '%USER%'
--AND VariableValue NOT LIKE '%Service%' 
AND VariableValue LIKE '%\%'
AND VariableToken NOT LIKE '%ServiceName%'
ORDER BY 3
