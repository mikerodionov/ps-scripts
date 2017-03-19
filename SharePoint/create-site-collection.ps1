Get-SPWebTemplate
$Template = Get-SPWebTemplate "STS#0"
New-SPSite -Url "https://cndrm-srv03.apps.conundrum.com" -OwnerAlias "conundrum\administrator" -Template $template
