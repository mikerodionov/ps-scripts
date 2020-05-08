Add-PSSnapin Microsoft.SharePoint.PowerShell –erroraction SilentlyContinue
$web = Get-SPWeb -Identity http://...
$list = $web.GetList($web.Url + "/Lists/" + “list name”)
$type = "ItemDeleting" #or any other type, like ItemDeleting, ItemAdding, ItemUpdating, ...
$numberOfEventReceivers = $list.EventReceivers.Count

if ($numberOfEventReceivers -gt 0)
{
   for( $index = $numberOfEventReceivers -1; $index -gt -1; $index–-)
   {
      $receiver = $list.EventReceivers[$index] ;
      $name = $receiver.Name
      $typ = $receiver.Type ;
      if ($typ -eq $type)  #or you can check ($name -eq "event receiver's name") if you have more then one event receivers of the same type
      {
         $receiver.Delete()
         Write-Host "Event receiver " $name " is deleted"
      }
   }
}
else
{
   Write-Host " There is no EventReceivers of type " $type " registered for this list "
}
$web.Dispose()
