#Load SharePoint PS Module (if not already loaded)
$ver = $host | select version
if ($ver.Version.Major -gt 1) {$host.Runspace.ThreadOptions = "ReuseThread"} 
if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) 
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

# Check CSOM Calls throttling setting (default is 150,000)
# It checks the time for the request that the app makes to the client.svc service (CSOM Calls) 
# if its bigger than 150,000 milliseconds your app CSOM request will be blocked and throttled
# Set CSOM Calls throttling setting
# Set web app variable:
$wa='http://<URL of your on-premises farm>'
$webapp = Get-SPWebApplication -Identity $wa
$webapp.AppResourceTrackingSettings.Rules.Get(
[Microsoft.SharePoint.SPResourceKind]::ClientServiceRequestDuration)

# Remove/disable threshold run, you aslo need removal to set different values
$wa='http://<URL of your on-premises farm>'
$webapp = Get-SPWebApplication -Identity $wa
$rule = $webapp.AppResourceTrackingSettings.Rules.Get(
[Microsoft.SharePoint.SPResourceKind]::ClientServiceRequestDuration)
$rule.Remove()

# Set CSOM Calls throttling setting setting to another value
# Set web app variable:
$wa='http://<URL of your on-premises farm>'
# Specify desired threshold value in milliseconds
$threshold=300000
$webapp = Get-SPWebApplication -Identity $wa
$webapp.AppResourceTrackingSettings.Rules.Add(
[Microsoft.SharePoint.SPResourceKind]::ClientServiceRequestDuration, $threshold, $threshold)
