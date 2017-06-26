# Tested with SharePoint 2010
# Restores editable user fields after UPA provisioning
$web = Get-SPWeb http://intranet.contoso.com/
$names = "Title", "EMail", "MobilePhone", "Notes", "SipAddress", "Picture", "Department", "JobTitle"
foreach( $name in $names )
{
    $f = $web.SiteUserInfoList.Fields.GetFieldByInternalName($name);
    $f.Hidden = $false
    $f.ReadOnlyField = $false
    $f.Update()
}
