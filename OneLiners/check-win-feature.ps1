#Check if Windows Feature with specific name (adjust -like "*static*") is installed, no results being returned in case it is not
Get-WindowsFeature | Where-Object {$_.Installed -match “True” -AND $_.DisplayName -like "*static*"} | Select-Object
