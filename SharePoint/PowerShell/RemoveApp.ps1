$instances = Get-SPAppInstance -Web https://portal.conundrum.com
$instance = $instances | where {$_.Title -eq 'Application Name'}
Uninstall-SPAppInstance -Identity $instance
