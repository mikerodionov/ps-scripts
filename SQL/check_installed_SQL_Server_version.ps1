$inst = (get-itemproperty 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server').InstalledInstances
foreach ($i in $inst)
{
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
