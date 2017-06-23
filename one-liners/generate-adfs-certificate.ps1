#This requires PSPKI - https://pspki.codeplex.com
Import-Module PSPKI
New-SelfSignedCertificateEx  -Subject 'CN=adfs.conundrum.com' -ProviderName "Microsoft Enhanced RSA and AES Cryptographic Provider" 
`-KeyLength 2048 -FriendlyName 'OAFED SelfSigned' -SignatureAlgorithm sha256 -EKU "Server Authentication", "Client authentication" 
`-KeyUsage "KeyEncipherment, DigitalSignature" -Exportable -StoreLocation "LocalMachine"
