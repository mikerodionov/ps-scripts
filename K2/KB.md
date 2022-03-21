## On Windows Server 2019 and with 5.3 K2 Configuration service fails to start (clean install)

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

## K2 5.3 error in installer trace + unable to open K2 web UIs after installation

Installer trace error:
```
 AuthorizationBase.Execute: Logged Error: Failed: SourceCode.Authorization.Interfaces.EntityNotFoundException: The  with the ID '1f042828-2abc-4f7f-b5c9-6ae5c33ce75e' could not be found.
   at SourceCode.Hosting.Client.BaseAPI.BaseAPIConnection.RemoteCall(String TypeName, String MethodName, Object[] Parameters, Boolean[] NullList, MarshalMessageType CallType)
   at SourceCode.Authorization.Client.AuthorizationClient.DoSessionCall(String method, Object[] parameters)
   at SourceCode.Install.Package.Actions.Authorization.AuthorizationBase.BreakObjectInheritance(Guid objectID, InheritanceRightOption option)
   at SourceCode.Install.Package.Actions.Authorization.BreakObjectInheritance.ExecuteTarget(Target target)
   at SourceCode.Install.Package.Actions.Authorization.AuthorizationBase.Execute(Target target)
```
Sample web UIs error:

```
Form 'com.K2.System.Workspace.Form.Workspace' could not be found. Ensure that the form exists, that it is checked in, and that you are authorized to run the form and its views.

(http 500 error) 
```

Solution: force packages reinstall as desctibed in [K2 5.3 Force packages reinstallation](##-K2-5.x-Force-packages-reinstallation)

## K2 5.x Force packages reinstallation

1. Browse to: C:\Program Files (x86)\K2\Setup
*  Delete all the files that end on .kspx 

2. Browse to: C:\Program Files (x86)\K2\Bin\ControlPack Controls
* Delete all the files except “Telerik.Web.UI.dll

3. Execute this script against the K2 DB after taking a full K2 database backup:

```SQL
DELETE * FROM [K2].[Hostserver].[HostserverSetting]
WHERE [Name] LIKE '%.kspx%' 
OR [Name] LIKE 'Register_Control_%'
GO
```

4. Run installer with CONFIGURE option

5. Reinstall the current K2 Cumulative Update and FixPack on the environment

## K2 5.3 CU installation declines to proceed - installed version not recognized

PROBLEM: You have 5.3 installet yet 5.3 CU declines to install, with the following error:

![image](/K2/Images/K253CUDoesNotSupportUpdatingYourVersion.png)

K2 Five (5.3) Cumulative Update does not support updating your version

SOLUTION:
* With FP installer window open you can use Ctrt + Shift + F8 to open trace file
* In trace file you will be able to see supported/expected K2 versions for CU (InstallChekcer.IsProductIntalledfromNamePart)
* In case of 5.3 April 2020 CU you may see that expected full version/build is "5.0004.1000.1" for K2 5.3 RTM, which does not match updated installer build you are using (.3 most likely) - that can be corrected by editing build number in Registry - see details below - adjust build digit as required (changine 3 to 1).
```PowerShell
# HKCL\K2_COMPONENT_GUID\Product Name
# K2 Package and Deployment
Get-ItemPropertyValue -Path Registry::HKEY_CLASSES_ROOT\Installer\Products\5CA5B2507AE700006419DDDDDDDDDD3D\ -Name ProductName
# K2 Server
Get-ItemPropertyValue -Path Registry::HKEY_CLASSES_ROOT\Installer\Products\5CA5B2507AE740906419B46010707EE8\ -Name ProductName
# K2 Site
Get-ItemPropertyValue -Path Registry::HKEY_CLASSES_ROOT\Installer\Products\5CA5B2507AE740906419B46010907675\ -Name ProductName
# K2 Core
Get-ItemPropertyValue -Path Registry::HKEY_CLASSES_ROOT\Installer\Products\5CA5B2507AE740906419B4601090FAFF\ -Name ProductName
# K2 Server
Get-ItemPropertyValue -Path Registry::HKEY_CLASSES_ROOT\Installer\Products\5CA5B2507AE740906419B46010707EE8\ -Name ProductName
```
* 5.3 November 2020 CU expects you to be on April 2020 CU first whis is not an expected behavior too - it does not check below that level, so easiest fix is install 5.3 April 2020 CU first
