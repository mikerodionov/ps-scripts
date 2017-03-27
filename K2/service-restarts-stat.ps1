# This script will grab 30 latest service restart event I write output into C:\%servername%.xls
# Run on K2 server which hosts K2 service
Get-EventLog -LogName system -Source "service control manager" |?{$_.message -match "blackpearl"} | select timegenerated, message -First 30 | Export-Csv "C:\Servie_Restarts_$env:computername.xls"
