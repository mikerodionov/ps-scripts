# In Windows Server 2012, SetSPN will no longer be able to register duplicate SPNs in a domain. 
# When SetSPN –a is used, SetSPN will treat it as SetSPN –s.
# Source: https://technet.microsoft.com/en-us/library/hh831747.aspx

#Host Server:
setspn –A K2Server/k2:5555 denallix\k2service
setspn -A K2Server/k2.denallix.com:5555 denallix\k2service

#Workflow Server 
setspn -A K2Server/k2:5252 denallix\k2service 
setspn -A K2Server/k2.denallix.com:5252 denallix\k2service

#Workspace Application Pool Identity Account
setspn -A HTTP/k2 denallix\k2webservice
setspn -A HTTP/k2.denallix.com denallix\k2webservice

#If the web site uses Host Header, create SPNs as the following:
setspn -A HTTP/k2 denallix\k2webservice
setspn -A HTTP/k2.denallix.com denallix\k2webservice

# Display registered SPNs:
setspn -T denallix -Q */K2*
# Check per specific account:
setspn -L denallix\k2service
setspn -L denallix\k2webservice
