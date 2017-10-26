#Host Server:
setspn – A BlackPearlServer/k2:5555 denallix\k2service
setspn – A BlackPearlServer/k2.denallix.com:5555 denallix\k2service

#Workflow Server 

setspn -S K2Server/k2:5252 denallix\k2service 
setspn -S K2Server/k2.denallix.com:5252 denallix\k2service

#Workspace Application Pool Identity Account

setspn -S HTTP/k2 denallix\k2webservice
setspn -S HTTP/k2.denallix.com denallix\k2webservice

#If the web site uses Host Header, create SPNs as the following:

setspn -S HTTP/k2 denallix\k2webservice
setspn -S HTTP/k2.denallix.com denallix\k2webservice
