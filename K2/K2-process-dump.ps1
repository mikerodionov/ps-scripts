$procid=get-process "K2HostServer" |select -expand id
# -ma Take hang dump (process running, not crashed)
C:\procdump\procdump.exe -accepteula -ma $procid C:\procdump\k2hostserver.dmp 
