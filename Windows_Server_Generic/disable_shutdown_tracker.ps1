if ( -Not (Test-Path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability'))
{
New-Item -Path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT' -Name Reliability -Force
}
Set-ItemProperty -Path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability' -Name ShutdownReasonOn -Value 0
