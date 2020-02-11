# TLS 1.2 Minimum Requirement Verify paths
# Paths for enabling TLS 1.2 explicitly for .NET - for 2 versions of .NET as per https://docs.microsoft.com/en-us/azure/active-directory/hybrid/reference-connect-tls-enforcement
Test-Path 'HKLM:\SOFTWARE\Microsoft\.NETFramework\v2.0.50727'
Test-Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v2.0.50727'
Test-Path 'HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319'
Test-Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319'
# Pats to enable TLS 1.2 protocol for client/server as per https://docs.microsoft.com/en-us/windows-server/identity/ad-fs/operations/manage-ssl-protocols-in-ad-fs
Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client'
Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server'
