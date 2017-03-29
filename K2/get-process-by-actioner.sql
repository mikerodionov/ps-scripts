-- This script returns Process full name based on the Actioner's name
SELECT DISTINCT [K2].[Server].[ProcSet].FullName, [K2].[Server].[ActionActInstRights].[ActionerID] 
FROM [K2].[Server].[ProcSet] 
INNER JOIN [K2].[Server].[Proc] 
ON [K2].[Server].[Proc].[ProcSetID] = [K2].[Server].[ProcSet].[ID] 
INNER JOIN [K2].[Server].[ProcInst] 
ON [K2].[Server].[ProcInst].[ProcID] = [K2].[Server].[Proc].[ID] 
INNER JOIN [K2].[Server].[ActionActInstRights] 
ON [K2].[Server].[ActionActInstRights].[ProcInstID] = [K2].[Server].[ProcInst].[ID] 

WHERE [K2].[Server].[ActionActInstRights].[ActionerID] = 'xxx' --Replace with ActionerID 
