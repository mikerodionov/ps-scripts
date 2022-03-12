$pass=ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force
$users=@('svc-k2','svc-k2web','svc-sql','sp-farm')

foreach ($element in $users)
{
  {
  New-ADUser -Name $element -AccountPassword $pass -Path "ou=Service Accounts,DC=infanova,DC=com" -Enabled $true -CannotChangePassword $true -PasswordNeverExpires $true
  }
}
