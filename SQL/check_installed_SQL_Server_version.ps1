# This scripts detecs installed SQL instances through registry and returns version information
$inst = (get-itemproperty 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server').InstalledInstances
foreach ($i in $inst)
{
$p=(Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\Instance Names\SQL').$i
(Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\Instance Names\SQL').$i
(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\$p\Setup").Edition
(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\$p\Setup").Version
$ver = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\$p\Setup").Version
    switch ($ver) {
        "14.0.3076.1" {"SQL Server 2017 CU14"; break} 
        "14.0.1000.169" {"SQL Server 2017 RTM"; break}
        "13.0.1601.5" {"SQL Server 2016 RTM"; break}
        "12.2.5000.0" {"SQL Server 2014 SP2"; break}
        default {"Unknown Version"; break}
    }
}
# Part below performs switch to Setup Bootstrap directory of SQL Server installation detected
switch ($ver.Substring(0,2)) {
    "14" {cd "C:\Program Files\Microsoft SQL Server\140\Setup Bootstrap\SQL2017"; break} 
    "13" {cd "C:\Program Files\Microsoft SQL Server\130\Setup Bootstrap\SQLServer2016"; break}
    "12" {cd "C:\Program Files\Microsoft SQL Server\120\Setup Bootstrap\SQLServer2014"; break}
    "11" {cd "C:\Program Files\Microsoft SQL Server\110\Setup Bootstrap\SQLServer2012"; break}
    default {"Unknown Version"; break}
    }
