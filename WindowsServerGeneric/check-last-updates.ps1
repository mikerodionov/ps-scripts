# List 5 last installed updates
Get-HotFix | Sort InstalledOn -Descending | Select -First 5
