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

# Check storage health (physical disks)
Get-StorageNode

# Set partition type for the disk:
Set-Disk -PartitionStyle <PartitionStyle>

# -PartitionStyle <PartitionStyle>
# Specifies the type of the partition. The acceptable values for this parameter are: MBR or GPT. The disk must be
# initialized (such as using the Initialize-Disk cmdlet) and set to read-write (IsReadOnly $false) before this cm
# dlet will work. The disk must be set to read-only = false before this cmdlet will work.
