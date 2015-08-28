#Requires Microsoft Powershell AD Module
Import-Module ActiveDirectory
#specify your top level domain (TLD) in the line below
$ForestRoot = 'top.domain'
(get-adforest -identity $ForestRoot).ForestMode
(get-adforest -identity $ForestRoot).Domains |
ForEach-Object {Get-ADDomain -Identity $_ |
ft DNSRoot,DomainMode -AutoSize}