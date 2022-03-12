# Script installs K2 server prerequisites on Windows Client OS
# Tested with Windows 10
Enable-WindowsOptionalFeature -Online -FeatureName MSMQ-Container
Enable-WindowsOptionalFeature -Online -FeatureName MSMQ-Server
Enable-WindowsOptionalFeature -Online -FeatureName MSMQ-ADIntegration
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45 -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication
