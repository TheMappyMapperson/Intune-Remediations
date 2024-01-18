#MEM Proactive remediation Detection Script
#Checks last time device was rebooted. If greater then X days will remediate to notify user to reboot
#https://msendpointmgr.com/2020/06/25/endpoint-analytics-proactive-remediations/
#Created by Derek Easter
#Last Updated: 6/7/2022

$Uptime= get-computerinfo | Select-Object OSUptime 
if ($Uptime.OsUptime.Days -ge 7){
    Write-Output "Device has not rebooted for $($Uptime.OsUptime.Days) days, notify user to reboot. Reported at: $(Get-Date)"
    Exit 1
}else {
    Write-Output "Device has rebooted $($Uptime.OsUptime.Days) days ago, all good. Reported at: $(Get-Date)"
    Exit 0
}