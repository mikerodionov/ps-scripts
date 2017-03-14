# -Remove / -Source switches are optional (Features on Demand)
# Core to full GUI conversion:
Install-WindowsFeature server-gui-mgmt-infra,server-gui-shell -Source wim:d:\sources\install.wim:2
# Core to full Min Server Interface:
Install-WindowsFeature server-gui-mgmt-infra -Source wim:d:\sources\install.wim:2
# Full GUI to Min Server Interface
Uninstall-WindowsFeature server-gui-shell -Remove
# Full GUI to Core:
Uninstall-WindowsFeature server-gui-shell,server-gui-mgmt-infra -Remove
