#Load PowerShell AD Module
Import-Module ActiveDirectory
#sSecify your top level domain (TLD) in the line below:
$ForestRoot = 'top.domain'
#Retrieves FFL
(get-adforest -identity $ForestRoot).ForestMode
#Retrieves DFL
(get-adforest -identity $ForestRoot).Domains |
ForEach-Object {Get-ADDomain -Identity $_ |
ft DNSRoot,DomainMode -AutoSize}
