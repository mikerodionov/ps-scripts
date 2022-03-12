#Load SharePoint PS Module (if not already loaded)
$ver = $host | select version
if ($ver.Version.Major -gt 1) {$host.Runspace.ThreadOptions = "ReuseThread"} 
if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) 
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

# Use this cmdlet to get a list of available templates: Get-SPWebTemplate
# Create SP site using specified template:
# APPCATALOG#0 = App Catalog Site
# STS#0 = Team Site
# SPSMSITEHOST#0 = My Sites Host
$Template = Get-SPWebTemplate "APPCATALOG#0"
New-SPSite -Url "https://cndrm-srv03.apps.conundrum.com" -OwnerAlias "conundrum\administrator" -Template $template
