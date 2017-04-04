# Load SharePoint PS Module (if not already loaded)
$ver = $host | select version
if ($ver.Version.Major -gt 1) {$host.Runspace.ThreadOptions = "ReuseThread"} 
if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) 
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

# Create App Management Service Application

# Adjust -Identity parameter as necessary for managed service account
# Make sure that account specified has been added as managed accont in SharePoint
# CA > Security > Configure managed accounts
$msa = Get-SPManagedAccount -Identity conundrum\svc-sp-serviceapps
 
# Create the App Management Service Application Pool
if ((Get-SPServiceApplicationPool "AppManagementAppPool" -ErrorAction SilentlyContinue) -eq $null)
    {
    $AppPoolAppSvc = New-SPServiceApplicationPool -Name "AppManagementAppPool" -Account $msa
    }
    else {$AppPoolAppSvc = Get-SPServiceApplicationPool "AppManagementAppPool"}

# Create App Management Service Application
# App Management Service Application required for app catalog as it establishes subdomains for apps and generates app IDs
$AppManagement = New-SPAppManagementServiceApplication -Name "App Management Service" -ApplicationPool $AppPoolAppSvc `
-DatabaseName SP2013_AppManagementSvc
# Create App Management Service Application Proxy
$AppManagementProxy = New-SPAppManagementServiceApplicationProxy -Name "App Management Service Proxy" -ServiceApplication $AppManagement
 
# Create the Subscription Settings Service Application

# Create the Subscription Settings Service Application Pool:
if ((Get-SPServiceApplicationPool "SubSettingsAppPool" -ErrorAction SilentlyContinue) -eq $null)
    {
    $AppPoolSubSvc = New-SPServiceApplicationPool -Name "SubSettingsAppPool" -Account $msa
    }
    else {$AppPoolAppSvc = Get-SPServiceApplicationPool "SubSettingsAppPool"}

# Create the Subscription Settings Service Application
# Subscription Settings Service Application required for app catalog as it handles handles app permissions and licensing information
$SubSettings = New-SPSubscriptionSettingsServiceApplication -Name "Subscription Settings Service" -ApplicationPool $AppPoolSubSvc `
-DatabaseName SP2013_SubscriptionSettingsSvc
# Create the Subscription Settings Service Application Proxy
$SubSettingsProxy = New-SPSubscriptionSettingsServiceApplicationProxy -ServiceApplication $SubSettings

# Verify provisioned service applications:
Get-SPServiceApplication -Name 'App Management Service' | Select DisplayName, Status
Get-SPServiceApplication -Name 'Subscription Settings Service' | Select DisplayName, Status
