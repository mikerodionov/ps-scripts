function With-PSF {
    1..10 | ForEach-Object {
        try {
            Write-Host "With PSF $Psitem"
            if ($psitem -eq 4) {
                1 / 0
            }
        }
        catch {
            Write-PSFMessage -Message "I hit the catch and " -Level Output -ErrorRecord $_
            Stop-PSFFunction -Message "Oh no we must stop " -AlwaysWarning
        }
        Write-Output "$Psitem I do run this code"
    }
}
function With-PSFContinue {
    1..10 | ForEach-Object {
        try {
            Write-Host " $Psitem"
            if ($psitem -eq 4) {
                1 / 0
            }
        }
        catch {
            Write-PSFMessage -Message "I hit the catch and " -Level Output -ErrorRecord $_
            Stop-PSFFunction -Message "Oh no we must stop " -AlwaysWarning -Continue
        }
        Write-Output "$Psitem I do run this code"
    }
}
function With-PSFSilentlyContinue {
    1..10 | ForEach-Object {
        try {
            Write-Host "$Psitem"
            if ($psitem -eq 4) {
                1 / 0
            }
        }
        catch {
            Write-PSFMessage -Message "I hit the catch and " -Level Output -ErrorRecord $_
            Stop-PSFFunction -Message "Oh no we must stop " -AlwaysWarning -SilentlyContinue
        }
        Write-Output "$Psitem I do run this code"
    }
}
function With-PSFLabel {
 :outer foreach ($x in 20..10) {
    Write-Host "Outside $x - run 100 times"
        1..100 | ForEach-Object {
            try {
                Write-Host "Inside $Psitem"
                if ($psitem -eq 4) {
                    1 / 0
                }
            }
            catch {
                Write-PSFMessage -Message "I hit the catch and " -Level Output -ErrorRecord $_
                Stop-PSFFunction -Message "Oh no we must stop " -AlwaysWarning -ContinueLabel outer -Continue
            }
            Write-Output "$Psitem I do run this code"
        }
    }
}
With-PSF
With-PSFContinue
With-PSFSilentlyContinue
With-PSFLabel # Everytime I hit 4 in the inside loop I will hit the catch and then go tot eh outer loop
Its slightly different with PSFStop
