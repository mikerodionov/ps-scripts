Get-EventLog -LogName system -Source "service control manager" |?{$_.message -match "blackpearl"} | select timegenerated, message -First 30
