$K2Server='DLX'
$DelegationSettings = Get-ADComputer -Filter {name -eq $K2Server -and msDS-AllowedToDelegateTo -like "*"} -Properties msDS-AllowedToDelegateTo
$DelegationSettings
