# Get-ChildItem -Path Cert:\LocalMachine\ -Recurse | where {$_.Issuer -eq "CN=K2 On Premise Root,O=K2"} | Select Subject, Issuer, Thumbprint
# Other things to remove: 'MICRO_SSL_CERT', Issued To: Environment Owner, Issued By: K2 On Premise Root Issued To: K2 On Premise Root, Issued By: K2 On Premise Root
# PS C:\Windows\system32> Get-ChildItem -Path Cert:\LocalMachine\ -Recurse | Remove-Item

DELETE FROM [HostServer].[Configuration] where VariableToken = '[ROOT_CERT]'
DELETE FROM [HostServer].[Configuration] WHERE VariableToken = '[ROOT_CERT_THUMBPRINT] '
DELETE FROM [HostServer].[Configuration] WHERE VariableToken = '[ROOT_CERT_PWD] '
DELETE FROM [HostServer].[Configuration] WHERE VariableToken = '[CLIENT_AUTH_CERT] '
DELETE FROM [HostServer].[Configuration] WHERE VariableToken = '[CLIENT_AUTH_CERT_THUMBPRINT] '
DELETE FROM [HostServer].[Configuration] WHERE VariableToken = '[CLIENT_AUTH_CERT_PWD] '
DELETE FROM [HostServer].[Configuration] WHERE VariableToken = '[MICRO_SSL_CERT_THUMBPRINT] '
DELETE FROM [HostServer].[Configuration] WHERE VariableToken = '[MICRO_SSL_CERT] '
DELETE FROM [HostServer].[Configuration] WHERE VariableToken = '[MICRO_SSL_CERT_PWD]'

UPDATE [HostServer].[Configuration] SET VariableValue = 'true' WHERE VariableToken = '[SERVICEUSERCHANGED]' 
