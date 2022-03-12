# Enable/disable WFAS for specified profiles - adjust Enabled parameter as appropriate:
# Enabled False - WFAS disabled / Enabled True - WFAS enabled
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
