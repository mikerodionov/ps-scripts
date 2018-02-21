# Obtain K2 service PID
$procid=get-process "K2HostServer" |select -expand id
# Create target folder if not exist:
$DumpPath="C:\dumps"
If (!(Test-Path $DumpPath))
    {
    Write-Host 'Creating folder'
    (New-Item $DumpPath -ItemType Directory | out-null)
    } 
    Else {
    Write-Host 'Folder already exist'
    }
# -ma - Write a full dump file which includes All the Image, Mapped and Private memory
# -ma - Just takes a full dump immediately from running process
# -e -ma  - takes full dump file on unhandled exception aka crash dump
C:\procdump\procdump.exe -accepteula -ma $procid $DumpPath\k2hostserver.dmp
