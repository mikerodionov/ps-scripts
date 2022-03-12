# Load SharePoint PS Module (if not already loaded)
# You only need this section if you want to run this script from PS ISE / outside of SP Management Shell
$ver = $host | select version
if ($ver.Version.Major -gt 1) {$host.Runspace.ThreadOptions = "ReuseThread"} 
if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) 
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

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
