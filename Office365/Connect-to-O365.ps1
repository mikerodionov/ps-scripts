# Import module
Import-Module MSOnline

# Get connection credential
$cred = get-credential

# Establish connection
Connect-MsolService -Credential $cred

# Example command for testing purposes
Get-MsolUser
