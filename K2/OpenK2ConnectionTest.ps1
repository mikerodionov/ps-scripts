# Open K2 Connection Test
[System.Console]::WriteLine("Open Connection")
Add-Type -AssemblyName ('SourceCode.Workflow.Client, Version=4.0.0.0, Culture=neutral, PublicKeyToken=16a2c5aaaa1b130d')
$conn = New-Object -TypeName SourceCode.Workflow.Client.Connection
$s=Get-Date;
$conn.Open("K2Hostserver")
$conn.Close()
$e=Get-Date;
[System.Console]::WriteLine("Close Connection")
[System.Console]::WriteLine("Time: " + ($e - $s).TotalSeconds.toString() + " secs")
