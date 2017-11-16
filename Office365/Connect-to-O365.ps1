# Import module
Import-Module MSOnline

# Get connection credential
$cred = get-credential

# Establish connection
Connect-MsolService -Credential $cred
