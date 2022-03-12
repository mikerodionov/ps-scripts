$path = "C:\FusionLog"
If(!(test-path $path))
{
   New-Item -ItemType Directory -Force -Path $path
}

$RegKey = “HKLM:\SOFTWARE\Microsoft\Fusion”

If(!((Get-Item -Path $RegKey).GetValue("ForceLog") -ne $nul))
{
New-ItemProperty -Path $RegKey -Name “ForceLog” -PropertyType Dword -Value 1
}
Else
{
Set-ItemProperty -Path $RegKey -Name “ForceLog” -Value 1 -Force
}

If(!((Get-Item -Path $RegKey).GetValue("LogFailures") -ne $nul))
{
New-ItemProperty -Path $RegKey -Name “LogFailures” -PropertyType Dword -Value 1
}
Else
{
Set-ItemProperty -Path $RegKey -Name “LogFailures” -Value 1 -Force
}

If(!((Get-Item -Path $RegKey).GetValue("LogResourceBinds") -ne $nul))
{
New-ItemProperty -Path $RegKey -Name “LogResourceBinds” -PropertyType Dword -Value 1
}
Else
{
Set-ItemProperty -Path $RegKey -Name “LogResourceBinds” -Value 1 -Force
}


If(!((Get-Item -Path $RegKey).GetValue("EnableLog") -ne $nul))
{
New-ItemProperty -Path $RegKey -Name “EnableLog” -PropertyType Dword -Value 1
}
Else
{
Set-ItemProperty -Path $RegKey -Name “EnableLog” -Value 1 -Force
}

If(!((Get-Item -Path $RegKey).GetValue("LogPath") -ne $nul))
{
New-ItemProperty -Path $RegKey -Name “LogPath” -PropertyType String -Value "C:\FusionLog\"
}
Else
{
Set-ItemProperty -Path $RegKey -Name “LogPath” -Value "C:\FusionLog\"
}
