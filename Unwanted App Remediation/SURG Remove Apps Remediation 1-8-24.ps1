<#
.SYNOPSIS
Remidiation script for built-in Microsoft applications

.DESCRIPTION
Remidiates (unistalls) pre-defined default Microsoft applications.

.NOTES
To be used in the Endpoint Manager and as the remidiation script
#>

# List of Applications to Remove
$AppPackages = @(
    'Microsoft.BingNews'
    'Microsoft.BingWeather'
    'Microsoft.GamingApp'
    'Microsoft.GetHelp'
    'Microsoft.GetStarted'
    'Microsoft.Messaging'
    'Microsoft.Microsoft3DViewer'
    'Microsoft.MicrosoftOfficeHub'
    'Microsoft.MicrosoftSolitaireCollection'
    'Microsoft.MixedReality.Portal'
    'Microsoft.Office.OneNote'
    'Microsoft.OneConnect'
    'Microsoft.People'
    'Microsoft.Print3D'
    'Microsoft.SkypeApp'
    'Microsoft.windowscommunicationsapps'
    'Microsoft.WindowsFeedbackHub'
    'Microsoft.WindowsMaps'
    'Microsoft.Xbox.TCUI'
    'Microsoft.XboxApp'
    'Microsoft.XboxGameOverlay'
    'Microsoft.XboxGamingOverlay'
    'Microsoft.XboxIdentityProvider'
    'Microsoft.XboxSpeechToTextOverlay'
    'Microsoft.YourPhone'
    'Microsoft.ZuneMusic'
    'Microsoft.ZuneVideo'
    'MicrosoftTeams'
	'Microsoft.OutlookForWindows'
)

$Error.Clear()

foreach ($App In $AppPackages) 
{
    try {
        Write-Host "+ Removing AppX Package: $App"
        Get-AppxPackage -AllUsers -PackageTypeFilter Main,Bundle,Resource,Framework | Where-Object {$_.Name -eq $App } | Remove-AppxPackage -AllUsers

        Write-Host "+ Removing Provisioned Package: $App"
        Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq $App} | Remove-AppxProvisionedPackage -Online -AllUsers

        Write-Host ""
    }
    catch {
        Write-Host "** ERROR ** Failed to remove: $App **"
        Write-Host "ERROR: at $($_.InvocationInfo.ScriptLineNumber)"
        Write-Error "Message: " $_.Exception.Message
        Write-Host "StackTrace: "
        Write-Host $_.Exception.StackTrace
        Write-Host ""
        exit 1
    }    
}

exit 0