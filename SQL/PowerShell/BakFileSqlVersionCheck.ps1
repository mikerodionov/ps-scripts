#This script retrieves SQL Server version from BAK file and allows you to compare with your SQL Server version
#If your SQL Server version is lower that one which was  used to create backup you won't be able to restore BAK file
$BakFile= Read-Host "Provide full path to SQL BAK file (including file name with extension)"
$VerDetectQuery="RESTORE HEADERONLY FROM DISK='$BakFile'"
$BakMajorVer=Invoke-Sqlcmd -Query $VerDetectQuery | Select-Object -ExpandProperty SoftwareVersionMajor
$BakMinorVer=Invoke-Sqlcmd -Query $VerDetectQuery | Select-Object -ExpandProperty SoftwareVersionMinor
$BakBuildVer=Invoke-Sqlcmd -Query $VerDetectQuery | Select-Object -ExpandProperty SoftwareVersionBuild
$BakVer= "$BakMajorVer.$BakMinorVer.$BakBuildVer.0"

$ServerSQLVer=Invoke-Sqlcmd -Query "SELECT SERVERPROPERTY('productversion')" | Select-Object -ExpandProperty Column1

Write-Host "Backup file SQL Server version is: " $BakVer
Write-Host "Your SQL Server version is:        " $ServerSQLVer
If ($BakVer -le $ServerSQLVer)
    {
    Write-Host "You can restore this backup on your server" -BackgroundColor Green
    }
    Else
    {
    Write-Host "You cannot restore backup on your server, to be able to  do that you need to upgrade SQL Server version" -BackgroundColor Red
    }
