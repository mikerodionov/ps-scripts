# This script takes local machine name for SQL Server name ($ServerName)
# and creates alias "K2SQL" ($AliasName)
# Tested on: Windows Server 2016/2019

$ServerName = Get-Content Env:Computername
$AliasName = "K2SQL" 
 
$64bit = "HKLM:\SOFTWARE\Microsoft\"
$32bit = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\"
 
## Check if the ConnectTo SubFolder exists in the registry if not create it
If((Test-Path -Path ($64bit + "MSSQLServer\Client\ConnectTo"))-ne $true)
    {
    $key = (get-item HKLM:\).OpenSubKey("SOFTWARE\Microsoft\MSSQLServer\Client", $true).CreateSubKey("ConnectTo")
    }
If((Test-Path -Path ($32bit + "MSSQLServer\Client\ConnectTo"))-ne $true)
    {
    $key = (get-item HKLM:\).OpenSubKey("SOFTWARE\Wow6432Node\Microsoft\MSSQLServer\Client", $true).CreateSubKey("ConnectTo")
    }

If((Test-Path -Path ($64bit + "MSSQLServer\Client\SuperSocketNetLib"))-ne $true)
    {
    $key = (get-item HKLM:\).OpenSubKey("SOFTWARE\Microsoft\MSSQLServer\Client", $true).CreateSubKey("SuperSocketNetLib")
    }
If((Test-Path -Path ($32bit + "MSSQLServer\Client\SuperSocketNetLib"))-ne $true)
    {
    $key = (get-item HKLM:\).OpenSubKey("SOFTWARE\Wow6432Node\Microsoft\MSSQLServer\Client", $true).CreateSubKey("SuperSocketNetLib")
    }
 
## Create the TCPAlias
$TCPAliasName="DBMSSOCN,"+$ServerName
New-ItemProperty -Path ($64bit + "MSSQLServer\Client\ConnectTo") -Name $AliasName -PropertyType string -Value $TCPAliasName
New-ItemProperty -Path ($32bit + "MSSQLServer\Client\ConnectTo") -Name $AliasName -PropertyType string -Value $TCPAliasName 

# Enable TCP/IP
Set-ItemProperty -Path ($64bit + "MSSQLServer\Client\SuperSocketNetLib") -Name ProtocolOrder -Value "tcp"
Set-ItemProperty -Path ($32bit + "MSSQLServer\Client\SuperSocketNetLib") -Name ProtocolOrder -Value "tcp"
