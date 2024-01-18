Start-Process "C:\Program Files (x86)\Citrix\Citrix Workspace 1912\TrolleyExpress.exe" -Wait -ArgumentList "/uninstall /silent /cleanup"
Get-ScheduledTask | ? {$_.TaskName -eq "PushLaunch"} | Start-ScheduledTask
Exit 0