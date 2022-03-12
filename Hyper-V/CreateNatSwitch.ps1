New-VMSwitch -SwitchName “NATSwitch” -SwitchType Internal
New-NetIPAddress -IPAddress 192.168.210.1 -PrefixLength 24 -InterfaceAlias “vEthernet (NATSwitch)”
New-NetNAT -Name “NATNetwork” -InternalIPInterfaceAddressPrefix 192.168.210.0/24
