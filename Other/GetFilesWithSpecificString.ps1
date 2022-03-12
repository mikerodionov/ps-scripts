# Search for specified string through all files in specified directory, filtering files to search in
$dir='C:\Program Files (x86)\K2 blackpearl\Setup\Log'
$string='Logged Error'
Get-ChildItem  $dir -recurse -Include *.log -Exclude *.exe | Select-String -pattern $string | group path | select name
