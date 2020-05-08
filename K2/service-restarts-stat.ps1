# This script will grab 30 latest service restart event and write output into C:\%servername%.xls
# Run on K2 server which hosts K2 service
Get-EventLog -LogName system -Source "service control manager" |?{$_.message -match "blackpearl"} | select timegenerated, message -First 30 | Export-Csv "C:\Servie_Restarts_$env:computername.xls"
# Option which will only show "terminated unexpectedly" event
Get-EventLog -LogName system -Source "service control manager" |?{$_.message -match "blackpearl"} | ?{$_.message -match "unexpectedly"} | select timegenerated, message -First 30 | Export-Csv "C:\Servie_Restarts_$env:computername.xls"
