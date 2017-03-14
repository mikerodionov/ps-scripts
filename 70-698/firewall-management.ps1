# Allow program via WF using netsh firewall (deprecated) - replacement netsh advfirewall firewall (WFAS)
# will create rule for Public Networks:
netsh firewall add allowedprogram c:\windows\system32\tracert.exe "Trace Route" enable
# Applying the same rule to Private Networks:
netsh firewall add allowedprogram c:\windows\system32\tracert.exe "Trace Route" enable custom 0.0.0.0-255.255.255.255 standard
# POSH alternative - will create rule both for Public and Private:
New-NetFirewallRule -DisplayName "Trace Route" -Direction Inbound -Program "c:\windows\system32\tracert.exe" -Action Allow
# Export/import of rules can be done with netsh advfirewall export or import commands
# Related POSH commands:
Get-NetFirewallRule
Enable-NetFirewallRule
Disable-NetFirewallRule
New-NetFirewallRule
Set-NetFirewallRule
