# This scipt allows to remove .NET 4.6.1 if it installed
IF (get-hotfix -id KB3102467 -ErrorAction SilentlyContinue)
{

$title = ".NET 4.6.1 Detected"
$message = "Do you want to uninstall .NET 4.6.1?"

$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", `
    "Removes .NET 4.6.1."

$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", `
    "Exit script"

$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)

$result = $host.ui.PromptForChoice($title, $message, $options, 0) 

switch ($result)
    {
        0 {"Starting .NET 4.6.1 removal"
        Invoke-Command {wusa.exe /uninstall /KB:3102467 /qb /norestart}
        }
        1 {"Operation cancelled"}
    }

}
ELSE {".NET 4.6.1 is not installed on this machine"}
