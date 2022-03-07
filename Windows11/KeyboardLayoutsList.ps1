# Use this if UI does not allow you to remove KB layout you don't need
$1 = New-WinUserLanguageList en-US
$1.Add("ru-RU")
Set-WinUserLanguageList $1
