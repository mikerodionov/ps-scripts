# Set credentials
$pwd = ConvertTo-SecureString -String 'Pa$$w0rd' -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential("Administrator", $pwd)

# Remotely connect to PS session via PowerShell direct
Enter-PSSession -VMName NANO-SRV-01 -Credential $creds
