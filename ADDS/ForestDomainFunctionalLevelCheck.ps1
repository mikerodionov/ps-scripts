# Load PowerShell AD Module
Import-Module ActiveDirectory
# Specify your top level domain (TLD) in the line below:
$ForestRoot = 'top.domain'
# Retrieve FFL
(get-adforest -identity $ForestRoot).ForestMode
# Retrieve DFL
(get-adforest -identity $ForestRoot).Domains | ForEach-Object {Get-ADDomain -Identity $_ | ft DNSRoot,DomainMode -AutoSize}
