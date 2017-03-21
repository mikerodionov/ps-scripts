# Load SharePoint PS Module (if not already loaded)
$ver = $host | select version
if ($ver.Version.Major -gt 1) {$host.Runspace.ThreadOptions = "ReuseThread"} 
if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) 
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

# Create App Management Service Application

# Adjust -Identity parameter as necessary for managed service account:
$msa = Get-SPManagedAccount -Identity conundrum\sp_serviceapps
 
# Create the App Management Service Application Pool
$AppPool = New-SPServiceApplicationPool -Name "AppManagementAppPool" -Account $msa

# Create App Management Service Application
# App Management Service Application required for app catalog as it establishes subdomains for apps and generates app IDs
$AppManagement = New-SPAppManagementServiceApplication -Name "App Management Service" -ApplicationPool $AppPool
# Create App Management Service Application Proxy
$AppManagementProxy = New-SPAppManagementServiceApplicationProxy -Name "App Management Service Proxy" -ServiceApplication $AppManagement
 
# Create the Subscription Settings Service Application

# Create the Subscription Settings Service Application Pool:
$AppPool2 = New-SPServiceApplicationPool -Name "SubSettingsAppPool" -Account $msa

# Create the Subscription Settings Service Application
# Subscription Settings Service Application required for app catalog as it handles handles app permissions and licensing information
$SubSettings = New-SPSubscriptionSettingsServiceApplication -Name "Subscription Settings Service" -ApplicationPool $AppPool2
# Create the Subscription Settings Service Application Proxy
$SubSettingsProxy = New-SPSubscriptionSettingsServiceApplicationProxy -ServiceApplication $SubSettings
