$RegKey = “HKLM:\SOFTWARE\Microsoft\Fusion”
if (-Not(Test-Path “$RegKey”)) {
    New-Item -Path $RegKey -Force
}
New-ItemProperty -Path $RegKey -Name “ForceLog” -PropertyType  Dword -Value 1
New-ItemProperty -Path $RegKey -Name “LogFailures” -PropertyType Dword -Value 1
New-ItemProperty -Path $RegKey -Name “LogResourceBinds” -PropertyType Dword -Value 1
New-ItemProperty -Path $RegKey -Name “EnableLog” -PropertyType Dword -Value 1
New-ItemProperty -Path $RegKey -Name “LogPath” -PropertyType String -Value "C:\FusionLog\"
