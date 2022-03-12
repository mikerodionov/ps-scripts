# Use HKCU to apply this for current user only, HKLM to apply to machine/all users
New-ItemProperty -Path HKLM:\Software\Microsoft\ServerManager -Name DoNotOpenServerManagerAtLogon -PropertyType DWORD -Value "0x1" –Force
