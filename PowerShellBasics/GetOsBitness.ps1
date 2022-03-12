Function GetOSBitness ()
{
# Detect OS bittness to run appropriate version of procdump
If (!(($env:PROCESSOR_ARCHITECTURE -eq "AMD64")))
    {
    Write-Host '32-bit OS'
    } 
    Else {
    Write-Host '64-bit OS'
    }
}
