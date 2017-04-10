# You can use this script if your "User Profile Synchronization Service" stuck in Starting state

Add-PSSnapin Microsoft.SharePoint.Powershell
$TypeName = “User Profile Synchronization Service”
$ServerName = “SERVERNAME” #Replace with your server name where the service is stuck on Starting
$Serviceinstance = Get-SPServiceInstance | where-object {$_.TypeName -eq $TypeName -and $_.Server.Address -eq $ServerName}
$Serviceinstance.Unprovision()
