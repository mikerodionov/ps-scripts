# Generic structure:
Function <Name> ($<parameter1>, $<parameter2>)
{
<Actions>
}
# Specific example:
Function Add ($a, $b)
{
$result = $a + $b
Write-Host $result
}
# Dot sourcing function:
. .\functions.ps1
