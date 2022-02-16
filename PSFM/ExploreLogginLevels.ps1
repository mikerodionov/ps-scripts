# Import module
Import-Module PSFramework
# Get log file path
Get-PSFConfig -FullName PSFramework.Logging.FileSystem.LogPath | select Value
# PSFMessage Logging  levels:
# Goes to output
Write-PSFMessage "This is a message" -Level Critical
Write-PSFMessage "This is a message" -Level Host

Write-PSFMessage "This is a message" -Level Error
Write-PSFMessage "This is a message" -Level Warning

Write-PSFMessage "This is a message" -Level Important
Write-PSFMessage "This is a message" -Level Output
Write-PSFMessage "This is a message" -Level Significant
# Goes to log if no Debug flag specified
Write-PSFMessage "This is a message" -Level Debug

Write-PSFMessage "This is a message" -Level InternalComment
