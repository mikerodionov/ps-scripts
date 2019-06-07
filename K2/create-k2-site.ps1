# Script:	create-k2-site.ps1
# Author:	Mikhail Rodionov
# Website:	http://www.mikerodionov.com
# Purpose:	Provision K2 web site with configured HTTPS bindings and self-signed certificate
# Version:	0.1
# Date:		2017-02-04

#Import IIS PS module:
Import-Module WebAdministration

#Define variables as needed for your environment:
$K2FarmNameFQDN='K2.conundrum.com'	
$SiteName = "K2"

#Create self-signed certificate
New-SelfSignedCertificate -DnsName $K2FarmNameFQDN -CertStoreLocation Cert:LocalMachine\My

#Create web site
$SiteFolder = Join-Path -Path 'C:\inetpub\wwwroot' -ChildPath $SiteName
New-WebSite -Name $SiteName -PhysicalPath $SiteFolder -Force
$IISSite = "IIS:\Sites\$SiteName"
Set-ItemProperty $IISSite -name  Bindings -value @{protocol="https";bindingInformation="*:443:$K2FarmNameFQDN"}
#Assign certificate to site binding
Get-ChildItem cert:\LocalMachine\My | where { $_.Subject -match $K2FarmNameFQDN } | select -First 1 | New-Item IIS:\SslBindings\*:443:$K2FarmNameFQDN
