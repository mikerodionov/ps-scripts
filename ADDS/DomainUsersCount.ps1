# Count number of users in specific domain
# Tested on Server 2008 R2, Server 2012 R2
(Get-ADUser -Filter 'objectClass -eq "user" -and objectCategory -eq "person" -and Enabled -eq $True' -SearchBase "DC=denallix,DC=com" -Properties SamAccountName | Measure-Object).Count
