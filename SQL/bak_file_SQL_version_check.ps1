#This script retrieves SQL Server version from BAK file and allows you to compare with your SQL Server version
#If your SQL Server version is lower that one which was  used to create backup you won't be able to restore BAK file
$BakFile='C:\backup.bak'
$VerDetectQuery="RESTORE HEADERONLY FROM DISK='$BakFile'"
$BakMajorVer=Invoke-Sqlcmd -Query $VerDetectQuery | Select-Object -ExpandProperty SoftwareVersionMajor
$BakMinorVer=Invoke-Sqlcmd -Query $VerDetectQuery | Select-Object -ExpandProperty SoftwareVersionMinor
$BakBuildVer=Invoke-Sqlcmd -Query $VerDetectQuery | Select-Object -ExpandProperty SoftwareVersionBuild
$BakVer= "$BakMajorVer.$BakMinorVer.$BakBuildVer.0"

$ServerSQLVer=Invoke-Sqlcmd -Query "SELECT SERVERPROPERTY('productversion')" | Select-Object -ExpandProperty Column1

Write-Host "Backup file SQL Server version is: " $BakVer
Write-Host "Your SQL Server version is:        " $ServerSQLVer
