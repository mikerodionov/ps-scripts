$procid=get-process "K2HostServer" |select -expand id
# -ma - Write a full dump file which includes All the Image, Mapped and Private memory
# -ma - Just takes a full dump immidiately from running process
# -e -ma  - takes full dump file on unhandled exception aka crash dump
C:\procdump\procdump.exe -accepteula -ma $procid C:\procdump\k2hostserver.dmp 
