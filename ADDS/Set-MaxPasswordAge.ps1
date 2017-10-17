# Disable passwords expiration
Set-ADDefaultDomainPasswordPolicy -Identity domain.com -MaxPasswordAge 0
Set-ADDefaultDomainPasswordPolicy -Identity domain.com -PasswordHistoryCount 0
