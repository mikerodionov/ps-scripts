$i = 0
Do {
$i=$i+1
[System.Console]::WriteLine("Starting K2 process instance" + $i)
Add-Type -AssemblyName ('SourceCode.Workflow.Client, Version=4.0.0.0, Culture=neutral, PublicKeyToken=16a2c5aaaa1b130d')
$conn = New-Object -TypeName SourceCode.Workflow.Client.Connection
$conn.Open("localhost")
# Adjust line below by specifying your workflow name
$pi = $conn.CreateProcessInstance("Project_Name\Workflow_Name")
$conn.StartProcessInstance($pi)
}
# Adjust line below to create required number of instances
While ($i -lt 1000)
[System.Console]::WriteLine("Done: " + $i + " process instances started")
