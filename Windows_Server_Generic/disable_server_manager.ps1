# This script disables automatic launch of Server Manager
# If you want to set it for current user only change -Path to HKCU
New-ItemProperty -Path HKLM:\Software\Microsoft\ServerManager -Name DoNotOpenServerManagerAtLogon -PropertyType DWORD -Value "0x1" -Force
