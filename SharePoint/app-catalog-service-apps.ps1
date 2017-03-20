# Load SharePoint PS Module (if not already loaded)
$ver = $host | select version
if ($ver.Version.Major -gt 1) {$host.Runspace.ThreadOptions = "ReuseThread"} 
if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) 
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

# Adjust -Identity parameter as necessary
$msa = Get-SPManagedAccount -Identity conundrum\sp_serviceapps
 
# Create the App Management Service Application 
# App Management Service Application required for app catalog as it establishes subdomains for apps and generates app IDs
$AppPool = New-SPServiceApplicationPool -Name "AppManagementAppPool" -Account $msa
 
$AppManagement = New-SPAppManagementServiceApplication -Name "App Management Service" -ApplicationPool $AppPool
 
$AppManagementProxy = New-SPAppManagementServiceApplicationProxy -Name "App Management Service Proxy" -ServiceApplication $AppManagement
 
# Create the Subscription Settings Service Application
# Subscription Settings Service Application required for app catalog as it handles handles app permissions and licensing information
$AppPool2 = New-SPServiceApplicationPool -Name "SubSettingsAppPool" -Account $msa
 
$SubSettings = New-SPSubscriptionSettingsServiceApplication -Name "Subscription Settings Service" -ApplicationPool $AppPool2
 
$SubSettingsProxy = New-SPSubscriptionSettingsServiceApplicationProxy -ServiceApplication $SubSettings
