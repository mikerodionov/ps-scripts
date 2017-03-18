# Create share, c:\Share folder must exist before executing this:
net share MyShareName=c:\Share /GRANT:User,READ

# PS alternative (by default shared with Read right for Everyone):
New-SMBShare -Path c:\Share -Name Share

#List shares (shared folder special icon is gone in Win 10):
Get-SMBShare
