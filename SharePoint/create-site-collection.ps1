# Use this cmdlet to get a list of available templates:
Get-SPWebTemplate
# Create SP site using specified template:
# STS#0 = Team Site
$Template = Get-SPWebTemplate "STS#0"
New-SPSite -Url "https://cndrm-srv03.apps.conundrum.com" -OwnerAlias "conundrum\administrator" -Template $template
