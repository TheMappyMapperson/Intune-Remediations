#Script designed to run via windows Task Scheduler at boot and wake in order to check for and run updates if device has not checked recently
#Writes status messages to Event logs > Applications and Services Logs > SURG_Logs
#Created by Derek Easter
#Stolen and edited by Mat Kyser

#Adds "Run Updates Script" source to SURG_Logs event log if does not exist
If ([System.Diagnostics.EventLog]::SourceExists("Run Updates Script") -eq $False) {
	New-EventLog -LogName SURG_Logs -Source "Run Updates Script" 
}

#Adds entry to event log that the script has started.
Write-EventLog -LogName "SURG_Logs" -Source "Run Updates Script" -EventID 3001 -EntryType Information -Message "Update Script Detection Start" -Category 1

#Test if computer has an intenet connection and wait until it does or 5 minutes as passed.
$Count = 1
$ping = test-netconnection -InformationLevel Quiet
If ($ping -eq $False){
    do { 
        Write-EventLog -LogName "SURG_Logs" -Source "Run Updates Script" -EventID 3001 -EntryType Information -Message "Waiting for Internet Connection" -Category 1
        Start-Sleep 10
        $ping = test-netconnection -InformationLevel Quiet
        $Count++
    } until (( $ping -eq $True) -or ($Count -gt "30"))
}

#If still no Internet Connection write to log and exit script. Else note in logs that internet was found and continue.
If ($ping -eq $False){
    Write-EventLog -LogName "SURG_Logs" -Source "Run Updates Script" -EventID 3001 -EntryType Information -Message "No Internet Connection found. Exiting Script." -Category 1
    Exit    
} Else {
    Write-EventLog -LogName "SURG_Logs" -Source "Run Updates Script" -EventID 3001 -EntryType Information -Message "Internet Connection found. Continuing Script." -Category 1 
}

#Installs and imports powershell module PSWindowsUpdate
Install-PackageProvider -Name NuGet -Force
Install-Module PSWindowsUpdate -Confirm:$False -Force
Import-Module PSWindowsUpdate

#Gets the last time the device booted and results of the last windows update
$LastBootTime = Get-CimInstance -ClassName win32_operatingsystem | Select-Object csname, lastbootuptime
$WULastResults = Get-WULastResults

#Write last boot time and Windows update results to event log
$Message = "Last Boot Time: " + $LastBootTime.lastbootuptime + "`r`n" + "Microsoft Updates Last Search Time: " + ([DateTime]$WULastResults.LastSearchSuccessDate).ToLocalTime() + "`r`n" + "Microsoft Updates Last Installation Time: " + ([DateTime]$WULastResults.LastInstallationSuccessDate).ToLocalTime()
Write-EventLog -LogName "SURG_Logs" -Source "Run Updates Script" -EventID 3001 -EntryType Information -Message $Message -Category 1

#Checks if the last time Windows updates was searched is more then 5 days ago
If ( ([DateTime]$WULastResults.LastSearchSuccessDate).ToLocalTime() -le $(get-date).AddDays(-5) ) {
    #Write Remediation Required
    Write-EventLog -LogName "SURG_Logs" -Source "Run Updates Script" -EventID 3001 -EntryType Information -Message "Updates Remediation Required. Windows updates are behind" -Category 1
    Write-Output "Updates Remediation Required."
	Exit 1
}
Else {
    #Write to Event log that there was nothing to do
    Write-EventLog -LogName "SURG_Logs" -Source "Run Updates Script" -EventID 3001 -EntryType Information -Message "Nothing to do. Windows updates Recently Searched" -Category 1
    Write-Output "Nothing to do."
	Exit 0
}

#Write to Event log that the script has ended.
Write-EventLog -LogName "SURG_Logs" -Source "Run Updates Script" -EventID 3001 -EntryType Information -Message "Update Script End" -Category 1