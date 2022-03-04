# ADDS Domain quick check
# v.1.0
# Mikhail Rodionov - mikerodionov.com

Function ADDSCHK ()
{
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

write-host 'Current server organizational unit:' $PC_OU -ForegroundColor Green
write-host 'Total number of domain users is ' $TNU -ForegroundColor Green
write-host 'Total number of enabled domain users is ' $TNEU -ForegroundColor Green
write-host 'Total number of disabled domain users is ' $TNDU -ForegroundColor Green
write-host 'Total number of domaim groups is ' $TNG -ForegroundColor Green
}
