# Remove all payload for not installed/enabled Windows features
# This feature is known as "Features on demand" and introduced in Server 2012/Windows 8
Get-WindowsFeature | Where-Object {$._Installed -eq $False} | Uninstall-WindowsFeature -Remove
