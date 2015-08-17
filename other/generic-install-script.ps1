#Generic installation task
#Detect OS bitness
#Method 1 - [IntPtr]::Size - Gets the size of current PS instance. The value of this property is 4 for 32-bit process, and 8 for 64-bit process
[IntPtr]::Size
#Stop service if required
#Backup database
#Back up files which bound to be replaced
#Replace files
#Start service
