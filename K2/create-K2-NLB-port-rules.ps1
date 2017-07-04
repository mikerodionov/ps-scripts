$InterfaceName = "Ethernet"
$ClusterPrimaryIP = "192.168.100.116"

#Removing default port rule for the NLB Cluster
Write-Host "Removing default port rule..." -ForegroundColor yellow
Get-NlbClusterPortRule -HostName . -ErrorAction SilentlyContinue | `
Remove-NlbClusterPortRule -Force -ErrorAction SilentlyContinue
#Adding SmartForms/Workspace rule for port 80 HTTP
Write-Host "Adding port rule for HTTP (TCP 80)" -ForegroundColor yellow
Add-NlbClusterPortRule -Protocol Tcp -Mode Multiple -Affinity Single -StartPort 80 `
-EndPort 80 -Timeout 1 -InterfaceName $InterfaceName -IP $ClusterPrimaryIP| Out-Null
#Adding SmartForms/Workspace rule for port 443
Write-Host "Adding port rule for HTTPS (TCP 443)" -ForegroundColor yellow
Add-NlbClusterPortRule -Protocol Tcp -Mode Multiple -Affinity Single -StartPort 443 `
-EndPort 443 -Timeout 1 -InterfaceName $InterfaceName -IP $ClusterPrimaryIP| Out-Null
#Adding blackpearl rule for port 5252 - K2 workflow client connections
Write-Host "Adding blackpearl port rule for port 5252" -ForegroundColor yellow
Add-NlbClusterPortRule -Protocol Tcp -Mode Multiple -Affinity None -StartPort 5252 `
-EndPort 5252 -InterfaceName $InterfaceName -IP $ClusterPrimaryIP| Out-Null
#Adding blackpearl rule for port 5555 - K2 Host Server connections from client assemblies
Write-Host "Adding blackpearl port rule for port 5555" -ForegroundColor yellow
Add-NlbClusterPortRule -Protocol Tcp -Mode Multiple -Affinity None -StartPort 5555 `
-EndPort 5555 -InterfaceName $InterfaceName -IP $ClusterPrimaryIP| Out-Null
Write-Host "Rules configuration compoleted" -ForegroundColor green
