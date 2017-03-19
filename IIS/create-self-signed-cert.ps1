#Create self-signed certificate
New-SelfSignedCertificate -DnsName $K2FarmNameFQDN -CertStoreLocation cert:Localmachine\My
