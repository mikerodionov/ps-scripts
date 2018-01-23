$Outlook2016='HKCU:\Software\Microsoft\Office\16.0\Outlook\'
$Outlook2013='HKCU:\Software\Microsoft\Office\15.0\Outlook\'
$Outlook2010='HKCU:\Software\Microsoft\Office\14.0\Outlook\'

Test-Path $Outlook2016

New-ItemProperty $Outlook2016 -Name ForcePstPath -Value "C:\Outlook"
