# Prompt the user for parameters
$webURL = Read-Host “URL of the Web”
$listName = Read-Host “Name of the list/library”

# Get a reference to the SharePoint web
$web = Get-SPWeb $webURL

# Get a reference to the SharePoint list or library
$list = $web.Lists[$listName]
foreach($eventReceiverDef in $list.EventReceivers)
{
    if($eventReceiverDef.Name -ne “”)
    {
                    $eventInfo = $eventReceiverDef.Name + ” – ” + $eventReceiverDef.Type
                    Write-Host $eventInfo -BackgroundColor Green -ForegroundColor Black
    }
}
