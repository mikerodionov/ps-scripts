$DumpPath='C:\Dumps'
$NetV2='C:\Windows\Microsoft.NET\Framework\v2.0.50727'
$NetV2x64='C:\Windows\Microsoft.NET\Framework64\v2.0.50727'
$NetV4='C:\Windows\Microsoft.NET\Framework\v4.0.30319'
$NetV4x64='C:\Windows\Microsoft.NET\Framework64\v4.0.30319'

$NetV2Dump="$DumpPath\Microsoft.NET\Framework\v2.0.50727"
$NetV2x64Dump="$DumpPath\Microsoft.NET\Framework64\v2.0.50727"
$NetV4Dump="$DumpPath\Microsoft.NET\Framework\v4.0.30319"
$NetV4x64Dump="$DumpPath\Microsoft.NET\Framework64\v4.0.30319"

If (!(Test-Path $DumpPath))
    {
    Write-Host 'Creating folder'
    (New-Item $DumpPath -ItemType Directory | out-null)
    } 
    Else {
    Write-Host 'Folder already exist'
    }




Write-Host "Attempting to copy $NetV2\mscordacwks.dll" -ForegroundColor Green
If (!(Test-Path "$NetV2\mscordacwks.dll"))
    {
    Write-Host "$NetV2\mscordacwks.dll - File not found, skipping" -ForegroundColor Red
    }
    Else 
    {
    
    If (!(Test-Path "$NetV2Dump")) {New-Item "$NetV2Dump" -Type Directory | out-null}
    Copy-Item "$NetV2\mscordacwks.dll" -Destination "$NetV2Dump\mscordacwks.dll"
    Write-Host "Done!" -ForegroundColor Green
    }

Write-Host "Attempting to copy $NetV2\sos.dll" -ForegroundColor Green
If (!(Test-Path "$NetV2\sos.dll"))
    {
    Write-Host "$NetV2\sos.dll - File not found, skipping" -ForegroundColor Red
    }
    Else 
    {
    
    If (!(Test-Path "$NetV2Dump")) {New-Item "$NetV2Dump" -Type Directory | out-null}
    Copy-Item "$NetV2\sos.dll" -Destination "$NetV2Dump\sos.dll"
    Write-Host "Done!" -ForegroundColor Green
    }

Write-Host "Attempting to copy $NetV2x64\mscordacwks.dll" -ForegroundColor Green
If (!(Test-Path "$NetV2x64\mscordacwks.dll"))
    {
    Write-Host "$NetV2x64\mscordacwks.dll - File not found, skipping" -ForegroundColor Red
    }
    Else 
    {
    
    If (!(Test-Path "$NetV2x64Dump")) {New-Item "$NetV2x64Dump" -Type Directory | out-null}
    Copy-Item "$NetV2x64\mscordacwks.dll" -Destination "$NetV2x64Dump\mscordacwks.dll"
    Write-Host "Done!" -ForegroundColor Green
    }


Write-Host "Attempting to copy $NetV2x64\sos.dll" -ForegroundColor Green
If (!(Test-Path "$NetV2x64\sos.dll"))
    {
    Write-Host "$NetV2x64\sos.dll - File not found, skipping" -ForegroundColor Red
    }
    Else 
    {
    
    If (!(Test-Path "$NetV2x64Dump")) {New-Item "$NetV2x64Dump" -Type Directory | out-null}
    Copy-Item "$NetV2x64\sos.dll" -Destination "$NetV2x64Dump\sos.dll"
    Write-Host "Done!" -ForegroundColor Green
    }


Write-Host "Attempting to copy $NetV4\mscordacwks.dll" -ForegroundColor Green
If (!(Test-Path "$NetV4\mscordacwks.dll"))
    {
    Write-Host "$NetV4\mscordacwks.dll - File not found, skipping" -ForegroundColor Red
    }
    Else 
    {
    
    If (!(Test-Path "$NetV4Dump")) {New-Item "$NetV4Dump" -Type Directory | out-null}
    Copy-Item "$NetV4\mscordacwks.dll" -Destination "$NetV4Dump\mscordacwks.dll"
    Write-Host "Done!" -ForegroundColor Green
    }

Write-Host "Attempting to copy $NetV4\sos.dll" -ForegroundColor Green
If (!(Test-Path "$NetV4\sos.dll"))
    {
    Write-Host "$NetV4\sos.dll - File not found, skipping" -ForegroundColor Red
    }
    Else 
    {
    
    If (!(Test-Path "$NetV4Dump")) {New-Item "$NetV4Dump" -Type Directory | out-null}
    Copy-Item "$NetV4\sos.dll" -Destination "$NetV4Dump\sos.dll"
    Write-Host "Done!" -ForegroundColor Green
    }

Write-Host "Attempting to copy $NetV4x64\mscordacwks.dll" -ForegroundColor Green
If (!(Test-Path "$NetV4x64\mscordacwks.dll"))
    {
    Write-Host "$NetV4x64\mscordacwks.dll - File not found, skipping" -ForegroundColor Red
    }
    Else 
    {
    
    If (!(Test-Path "$NetV4x64Dump")) {New-Item "$NetV4x64Dump" -Type Directory | out-null}
    Copy-Item "$NetV4x64\mscordacwks.dll" -Destination "$NetV4x64Dump\mscordacwks.dll"
    Write-Host "Done!" -ForegroundColor Green
    }


Write-Host "Attempting to copy $NetV4x64\sos.dll" -ForegroundColor Green
If (!(Test-Path "$NetV4x64\sos.dll"))
    {
    Write-Host "$NetV4x64\sos.dll - File not found, skipping" -ForegroundColor Red
    }
    Else 
    {
    
    If (!(Test-Path "$NetV4x64Dump")) {New-Item "$NetV4x64Dump" -Type Directory | out-null}
    Copy-Item "$NetV4x64\sos.dll" -Destination "$NetV4x64Dump\sos.dll"
    Write-Host "Done!" -ForegroundColor Green
    }
