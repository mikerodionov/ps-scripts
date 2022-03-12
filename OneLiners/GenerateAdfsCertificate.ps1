#This requires PSPKI - https://pspki.codeplex.com
Import-Module PSPKI
New-SelfSignedCertificateEx  -Subject 'CN=adfs.conundrum.com' -ProviderName "Microsoft Enhanced RSA and AES Cryptographic Provider" 
`-KeyLength 2048 -FriendlyName 'OAFED SelfSigned' -SignatureAlgorithm sha256 -EKU "Server Authentication", "Client authentication" 
`-KeyUsage "KeyEncipherment, DigitalSignature" -Exportable -StoreLocation "LocalMachine"


#SP Side configuration:

$root = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2("c:\adfsParent.cer")

New-SPTrustedRootAuthority -Name "Token Signing Cert Parent" -Certificate $root

$cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2("c:\ADFS.cer")

New-SPTrustedRootAuthority -Name "Token Signing Cert" -Certificate $cert

$emailClaimMap = New-SPClaimTypeMapping -IncomingClaimType "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress" -IncomingClaimTypeDisplayName "EmailAddress" -SameAsIncoming

$upnClaimMap = New-SPClaimTypeMapping -IncomingClaimType "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/upn" -IncomingClaimTypeDisplayName "UPN" -SameAsIncoming

$roleClaimMap = New-SPClaimTypeMapping -IncomingClaimType "http://schemas.microsoft.com/ws/2008/06/identity/claims/role" -IncomingClaimTypeDisplayName "Role" -SameAsIncoming

$sidClaimMap = New-SPClaimTypeMapping -IncomingClaimType "http://schemas.microsoft.com/ws/2008/06/identity/claims/primarysid" -IncomingClaimTypeDisplayName "SID" -SameAsIncoming

$realm = "urn:sharepoint:Portal"

$signInURL = "https://cndrm-srv01/adfs/ls"

$ap = New-SPTrustedIdentityTokenIssuer -Name ADFS-Provider -Description "Conundrum ADFS Provider" -realm $realm -ImportTrustCertificate $cert -ClaimsMappings $emailClaimMap,$upnClaimMap,$roleClaimMap,$sidClaimMap -SignInUrl $signInURL -IdentifierClaim $emailClaimmap.InputClaimType
