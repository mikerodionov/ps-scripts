#Remove all payload for not installed/enabled Windows features
Get-WindowsFeature | Where-Object {$._Installed -eq $False} | Uninstall-WindowsFeature -Remove
