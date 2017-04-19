# Open K2 SQL Connection Test
[System.Console]::WriteLine("Open Connection")
Add-Type -AssemblyName ('SourceCode.SmartObjects.Client, Version=4.0.0.0, Culture=neutral, PublicKeyToken=16a2c5aaaa1b130d')
$conn = New-Object -TypeName SourceCode.SmartObjects.Client.SmartObjectClientServer
$s=Get-Date;
$conn.CreateConnection()
$conn.Connection.Open("Integrated=True;IsPrimaryLogin=True;Authenticate=True;EncryptedPassword=False;Host=K2Hostserver;Port=5555");
$conn.Connection.Close()
$e=Get-Date;
[System.Console]::WriteLine("Close Connection")
[System.Console]::WriteLine("Time: " + ($e - $s).TotalSeconds.toString() + " secs")
