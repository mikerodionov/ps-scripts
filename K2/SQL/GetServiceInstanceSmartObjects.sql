-- This script returns list of all SmOs based on SI with specific GUID
SELECT DISTINCT SystemName as SMOSystemName, DisplayName_XML AS SMODisplayName, SmartObjectGUID, SO.ID.value('@guid', 'nvarchar(100)') AS ServiceInstanceGUID
FROM [SmartBroker].[SmartObject]
CROSS APPLY SmartObjectXML.nodes('/smartobjectroot/methods/method/serviceinstances/serviceinstance[1]') AS SO(ID)
WHERE SO.ID.value('@guid', 'nvarchar(100)') = '%INSERT_SI_GUID%'
ORDER BY SMOSystemName
