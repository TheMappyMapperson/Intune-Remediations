#Script designed to run via windows Task Scheduler at boot and wake in order to check for and run updates if device has not checked recently
#Writes status messages to Event logs > Applications and Services Logs > SURG_Logs
#Created by Derek Easter
#Stolen by Mat Kyser

#Adds "Run Updates Script" source to SURG_Logs event log if does not exist
If ([System.Diagnostics.EventLog]::SourceExists("Run Updates Script") -eq $False) {
	New-EventLog -LogName SURG_Logs -Source "Run Updates Script" 
}

#Adds entry to event log that the script has started.
Write-EventLog -LogName "SURG_Logs" -Source "Run Updates Script" -EventID 3001 -EntryType Information -Message "Update Script Remediation Start" -Category 1

#Installs and imports powershell module PSWindowsUpdate
Install-PackageProvider -Name NuGet -Force
Install-Module PSWindowsUpdate -Confirm:$False -Force
Import-Module PSWindowsUpdate

    Start-Sleep 180

    #Runs O365 updater
    Write-EventLog -LogName "SURG_Logs" -Source "Run Updates Script" -EventID 3001 -EntryType Information -Message "Start O365 Pro Plus Updater" -Category 1
    Set-Location  "C:\Program Files\Common Files\microsoft shared\ClickToRun"
    ./OfficeC2RClient.exe /update user updatepromptuser=False forceappshutdown=True displaylevel=False
    
    #Starts Windows Updates
    $Output = get-windowsupdate -outvariable Output | out-string
    $Message = "Available Updates:" + "`r`n" + $Output
    Write-EventLog -LogName "SURG_Logs" -Source "Run Updates Script" -EventID 3001 -EntryType Information -Message $Message -Category 1

    $Output = Get-WindowsUpdate -AcceptAll -Install -AutoReboot -outvariable Output | out-string
    $Message = "Updates Installation Results:" + "`r`n" + $Output
    Write-EventLog -LogName "SURG_Logs" -Source "Run Updates Script" -EventID 3001 -EntryType Information -Message $Message -Category 1

#Write to Event log that the script has ended.
Write-EventLog -LogName "SURG_Logs" -Source "Run Updates Script" -EventID 3001 -EntryType Information -Message "Update Script Remediation End" -Category 1