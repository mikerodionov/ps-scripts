# Min 1 disk to create pool
# You then can create Storage Space from pool
# Resiliency types:
# - Simple (no resiliency) ~ the same as single disk, but you get thin provisioning and ability to add more disks later
# - Two-way mirror         ~ MIRROR, requires at least 2 drives
# - Three-way mirror       ~ MIRROR + PARITY, requires at least 5 drives, sustain 2 simultaneous disk failures
# - Parity                 ~ RAID 5, requires at least 3 drives

# Use Prepare for removal option if drive needs to be removed (for planned removal)
