# diskpart - legacy/depricated CMD tool for disks management
# PS cmdlets
# List disk / get disk information:
Get-Disk
# Initiailize disk:
Initialize-Disk -Number 2 -PartitionStyle GPT
# Create new partition:
New-Partition -DiskNumber 2 -UseMaximumSize -AssignDriveLetter
# Format volume:
Format-Voldume -DriveLetter X -FileSystem NTFS

# Check disk in online, but bad sectors scan/repair is still offline operation which requires reboot:
chkdsk /f /r
