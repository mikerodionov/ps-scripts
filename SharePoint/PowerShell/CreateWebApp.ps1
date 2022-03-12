# Load SharePoint PS Module (if not already loaded)
$ver = $host | select version
if ($ver.Version.Major -gt 1) {$host.Runspace.ThreadOptions = "ReuseThread"} 
if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) 
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

# Define variables
$WebAppName = 'SharePointHttp'
# For HTTPS you have to append New-SPWebApplication with -SecureSocketsLayer parameter
$Port = "80"
$URL = "http://SharePointHttp.denallix.com"
$AppPool = "SharePointHttp"
$AppPoolAcc = (Get-SPManagedAccount 'denallix\SPFarmService')
$DBName = "WSS_Content_SharePointHttp"

# Create web app if not exist
if (!(Get-SPWebApplication $WebAppName -ErrorAction SilentlyContinue))
{
Write-Host 'Creating Web Application ' $WebAppName -ForegroundColor Yellow
$ap = New-SPAuthenticationProvider
New-SPWebApplication -Name $WebAppName -Port $Port -Url $URL `
-ApplicationPool $AppPool -ApplicationPoolAccount $AppPoolAcc `
-AuthenticationProvider $ap -DatabaseName $DBName 
Write-Host 'Web Application' $WebAppName 'has been created' -ForegroundColor Green
}
else {Write-Host 'Web Application' $WebAppName 'already exist' -ForegroundColor Red}
