#Load SharePoint PS Module (if not already loaded)
$ver = $host | select version
if ($ver.Version.Major -gt 1) {$host.Runspace.ThreadOptions = "ReuseThread"} 
if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) 
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

# Rename web app, adjust variables below as required:
$old_wa_name="SharePoint - 80"
$new_wa_name="Portal"
$WebApp = SPWebApplication | where {$_.Name -match $old_wa_name}
$WebApp.Name =$new_wa_name
$WebApp.Update()
# This line is just to verify that web app name has been changed correctly:
Get-SPWebApplication | where {$_.Name -match $new_wa_name}
