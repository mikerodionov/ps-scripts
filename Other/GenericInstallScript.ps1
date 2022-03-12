#Generic installation task

#Detect OS bitness
#Method 1 Environment Variable:
#$ENV:PROCESSOR_ARCHITECTURE
#Method 2 Using Win32_OperatingSystem:
#(Get-WmiObject Win32_OperatingSystem -computername $computername).OSArchitecture
#Method 3 [IntPtr]::Size - Gets the size of current PS instance. The value of this property is 4 for 32-bit process, and 8 for 64-bit process:
#[IntPtr]::Size

#Stop service if required

#Backup database

#Run SQL scripts
#invoke-sqlcmd -inputfile "c:\mysqlfile.sql" -serverinstance "servername\serverinstance" -database "mydatabase" 
#there is an option to use SQL PS module, but it seems that module should be installed first (normally in place on SQL Servers)
#also SQL PS module name is SQL version dependent (contains smth like 110/120 in module name)

#Back up files which bound to be replaced

#Replace files

#Start service
