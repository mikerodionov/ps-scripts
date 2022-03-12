# Script to check PS bitness:

[reflection.assemblyname]::GetAssemblyName("C:\Program Files (x86)\K2 blackpearl\Bin\SourceCode.Workflow.Client.dll") | fl
[reflection.assemblyname]::GetAssemblyName("C:\Program Files (x86)\K2 blackpearl\Host Server\Bin\SourceCode.Workflow.Client.dll") | fl

[reflection.assemblyname]::GetAssemblyName("C:\Program Files (x86)\K2 blackpearl\Bin\SourceCode.HostClientAPI.dll") | fl
[reflection.assemblyname]::GetAssemblyName("C:\Program Files (x86)\K2 blackpearl\Host Server\Bin\SourceCode.HostClientAPI.dll") | fl
