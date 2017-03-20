#Adjust -Identity parameter as necessary
$msa = Get-SPManagedAccount -Identity conundrum\sp_serviceapps
 
#Create the App Management Service Application
$AppPool = New-SPServiceApplicationPool -Name "AppManagementAppPool" -Account $msa
 
$AppManagement = New-SPAppManagementServiceApplication -Name "App Management Service" -ApplicationPool $AppPool
 
$AppManagementProxy = New-SPAppManagementServiceApplicationProxy -Name "App Management Service Proxy" -ServiceApplication $AppManagement
 
#Create the Subscription Settings Service Application
$AppPool2 = New-SPServiceApplicationPool -Name "SubSettingsAppPool" -Account $msa
 
$SubSettings = New-SPSubscriptionSettingsServiceApplication -Name "Subscription Settings Service" -ApplicationPool $AppPool2
 
$SubSettingsProxy = New-SPSubscriptionSettingsServiceApplicationProxy -ServiceApplication $SubSettings
