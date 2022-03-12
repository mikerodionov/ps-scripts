# K2 for SharePoint App Upload User Account requirements:
# Local Administrator on the SharePoint Server
# Site Collection Administrator on the App Catalog Site Collection
# db_owner rights on the SharePoint_Config Database
# db_datareader role on the SharePoint_Config Database
# SPShelladmin DB role

# Grant SPShelladmin DB role on App Management DB
# Use Get-SPDatabase to get App Management DB ID
Add-SPShellAdmin -UserName Denallix\Administrator -database %database_ID%
