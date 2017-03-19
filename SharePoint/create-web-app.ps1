$ap = New-SPAuthenticationProvider
New-SPWebApplication -Name "Conundrum Apps" -Port 443 -Url "https://cndrm-srv03.apps.conundrum.com" '
-ApplicationPool "Conundrum Apps" -ApplicationPoolAccount (Get-SPManagedAccount "conundrum\svc-sp") '
-AuthenticationProvider $ap -SecureSocketsLayer -DatabaseName "WSS_Content_CNDRM_Apps"
