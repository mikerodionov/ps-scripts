# Count number of users in specific domain
(Get-ADUser -Filter 'objectClass -eq "user" -and objectCategory -eq "person"' -SearchBase "DC=denallix,DC=com" -Properties SamAccountName | Measure-Object).Count
