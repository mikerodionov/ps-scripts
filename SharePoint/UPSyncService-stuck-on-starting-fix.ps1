# You can use this script if your "User Profile Synchronization Service" stuck in Starting state

# Load SharePoint PS Module (if not already loaded)
$ver = $host | select version
if ($ver.Version.Major -gt 1) {$host.Runspace.ThreadOptions = "ReuseThread"} 
if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) 
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

$TypeName = “User Profile Synchronization Service”
$ServerName = “SERVERNAME” #Replace with your server name where the service is stuck on Starting
$Serviceinstance = Get-SPServiceInstance | where-object {$_.TypeName -eq $TypeName -and $_.Server.Address -eq $ServerName}
$Serviceinstance.Unprovision()
