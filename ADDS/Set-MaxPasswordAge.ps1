# Disable passwords expiration
Set-ADDefaultDomainPasswordPolicy -Identity domain.com -MaxPasswordAge 0
