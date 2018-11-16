#Specifiy name of machine to which you need to obtain OU
$pc='dlx'
(Get-ADComputer $pc).DistinguishedName

#Get total number of users (enabled and disabled)
(Get-ADUser -filter *).count
#Get total number of enabled users
(Get-AdUser -filter * |Where {$_.enabled -eq "True"}).count
#Get total number of disabled users
(Get-ADUser -filter * |Where {$_.enabled -ne "False"}).count
#Get number of groups
(Get-ADGroup -filter *).count
