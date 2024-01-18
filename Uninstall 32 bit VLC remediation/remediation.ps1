Start-Process "C:\Program Files (x86)\VideoLAN\VLC\uninstall.exe" -Wait -ArgumentList "/S /V /qn"
#Get-ScheduledTask | ? {$_.TaskName -eq "PushLaunch"} | Start-ScheduledTask
Exit 0