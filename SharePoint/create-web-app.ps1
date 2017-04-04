# Load SharePoint PS Module (if not already loaded)
$ver = $host | select version
if ($ver.Version.Major -gt 1) {$host.Runspace.ThreadOptions = "ReuseThread"} 
if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) 
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

# Create new web application
$ap = New-SPAuthenticationProvider
New-SPWebApplication -Name "Conundrum Apps" -Port 443 -Url "https://cndrm-srv03.apps.conundrum.com" `
-ApplicationPool "Conundrum Apps" -ApplicationPoolAccount (Get-SPManagedAccount "conundrum\svc-sp") `
-AuthenticationProvider $ap -SecureSocketsLayer -DatabaseName "WSS_Content_CNDRM_Apps"
