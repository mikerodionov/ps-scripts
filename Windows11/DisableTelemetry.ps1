# DataCollection GPO setting available in Windows 10, Windows 11
# 0 - Disabled
# 1 - Basic (Required)
# 2 - Enhanced
# 3 - Full (Optional) diagnostic data. Desktop Analytics requires at least basic diagnostic data.
# Microsoft recommends that you use the Optional (limited) (Enhanced (Limited)) level with Desktop Analytics

$RegKey = “HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection”

If(!((Get-Item -Path $RegKey).GetValue("AllowTelemetry") -ne $nul))
{
New-ItemProperty -Path $RegKey -Name “AllowTelemetry” -PropertyType Dword -Value 0
}
Else
{
Set-ItemProperty -Path $RegKey -Name “AllowTelemetry” -Value 0 -Force
}
