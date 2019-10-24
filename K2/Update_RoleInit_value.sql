-- To get %OAuthResourceID_GUID% check Authorization.OAuthResource table
USE K2
UPDATE HostServer.SecurityLabel
SET RoleInit = '
<RoleInit>
  <OAuthResourceID>%OAuthResourceID_GUID%</OAuthResourceID>
</RoleInit>
'
