Invoke-Command -Computername PC3,PC6,PC99 -ScriptBlock {Disable-WindowsOptionalFeature -Feature WindowsMediaPlayer}

Invoke-Command -Computername (type c:\pc_list.txt) -ScriptBlock {Disable-WindowsOptionalFeature -Feature WindowsMediaPlayer}

Invoke-Command -Computername (Get-ADComputer -filter *).Name -ScriptBlock {Disable-WindowsOptionalFeature -Feature WindowsMediaPlayer}
