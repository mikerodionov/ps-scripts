#Create self-signed certificate
$srv_name="https://*.apps.conundrum.com"
New-SelfSignedCertificate -DnsName $srv_name -CertStoreLocation cert:Localmachine\My
