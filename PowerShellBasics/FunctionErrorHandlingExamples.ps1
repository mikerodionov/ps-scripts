function With-Return {
    try {
        Write-Host "With a return "
        1 / 0
    }
    catch {
        Write-Output "I hit the catch"
        Return
    }
    Write-Output "I don't run this code"
}
function With-Continue {
    try {
        Write-Output "With a continue "
        1 / 0 
    }
    catch {
        Write-Output "I hit the catch"
        Continue
    }
    Write-Output "I do run this code"
}
function WithOut-Continue {
    try {
        Write-Output "Without a continue "
        1 / 0 
    }
    catch {
        Write-Output "I hit the catch"
    }
    Write-Output "I do run this code"
}
function With-Returnloop {
    1..10 | ForEach-Object {
        try {
            Write-Host "With a return $Psitem"
            if ($psitem -eq 4) {
                1 / 0
            }
        }
        catch {
            Write-Output "I hit the catch $Psitem"
        }
        Write-Output "$Psitem I do run this code"
    }
}
function With-Continueloop {
    1..10 | ForEach-Object {
        try {
            Write-Host "With a contiue $Psitem"
            if ($psitem -eq 4) {
                1 / 0
            }
        }
        catch {
            Write-Output "I hit the catch $Psitem"
            Continue
        }
        Write-Output "$Psitem I do run this code"
    }
}
function WithOut-Continueloop {
    1..10 | ForEach-Object {
        try {
            Write-Host "Without a continue $Psitem"
            if ($psitem -eq 4) {
                1 / 0
            }
        }
        catch {
            Write-Output "I hit the catch $Psitem"
        }
        Write-Output "$Psitem I do run this code"
    }
}
With-Return
With-Continue
WithOut-Continue
With-Returnloop
With-Continueloop
WithOut-Continueloop
