# Allow program via WF using netsh firewall (deprecated) - replacement netsh advfirewall firewall (WFAS)
netsh firewall add allowedprogram c:\windows\system32\tracert.exe "Trace Route" enable
# Applying the same rule to Private Networks:
netsh firewall add allowedprogram c:\windows\system32\tracert.exe "Trace Route" enable custom 0.0.0.0-255.255.255.255 standard
# POSH alternative:
New-NetFirewallRule -DisplayName "Trace Route" -Direction Inbound -Program "c:\windows\system32\tracert.exe" -Action Allow
