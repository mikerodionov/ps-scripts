# Stopping service using net stop:
net stop spooler

# Starting service using net start:
net start spooler

# The same can be done with sc:
sc stop spooler

# Check spooler service status with sc:
sc query spooler

# PS options (run PS as administrator)
Stop-Service -Name spooler
# OR
Stop-Service spooler

Start-Service -Name spooler
# OR
Start-Service spooler

Get-Service -Name spooler
# OR
Get-Service spooler
