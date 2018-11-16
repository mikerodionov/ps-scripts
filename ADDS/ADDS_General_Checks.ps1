#Specifiy name of machine to which you need to obtain OU
$pc=hostname
$PC_OU=(Get-ADComputer $pc).DistinguishedName
#Get total number of users (enabled and disabled)
$TNU=(Get-ADUser -filter *).count
#Get total number of enabled users
$TNEU=(Get-AdUser -filter * |Where {$_.enabled -eq "True"}).count
#Get total number of disabled users
$TNDU=(Get-ADUser -filter * |Where {$_.enabled -ne "False"}).count
#Get number of groups
$TNG=(Get-ADGroup -filter *).count

$pc organizational unit: $PC_OU
Total number of domain users is $TNU
Total number of enabled domain users is $TNEU
Total number of disabled domain users is $TNDU
Total number of domaim groups is $TNG
