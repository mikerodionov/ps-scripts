# On Windows Server 2019 and with 5.3 K2 Configuration service fails to start (clean install)

Start in console mode, and verify which error you are getting. You can possible receive something like that:

```
It was not possible to find any compatible framework version
The specified framework 'Microsoft.NETCore.App', version '2.1.11' was not found.
  - Check application dependencies and target a framework version installed at:
      C:\Program Files\K2\SourceCode.Configuration.Api\
  - Installing .NET Core prerequisites might help resolve this problem:
      https://go.microsoft.com/fwlink/?LinkID=798306&clcid=0x409
  - The .NET Core framework and SDK can be installed from:
      https://aka.ms/dotnet-download
  - The following versions are installed:
      2.1.7 at [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
      6.0.2 at [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
```

You will need to install required version of ASP.NET Core Runtime - https://dotnet.microsoft.com/en-us/download/dotnet/2.1
