
#Load SharePoint PS Module (if not already loaded)
$ver = $host | select version
if ($ver.Version.Major -gt 1) {$host.Runspace.ThreadOptions = "ReuseThread"} 
if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) 
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

# More details on throttling buckets: http://www.wictorwilen.se/sharepoint-2013-sharepoint-health-score-and-throttling-deep-dive

Get-SPWebApplicationHttpThrottlingMonitor -Identity https://portal.denallix.com
