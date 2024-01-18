<#
.SYNOPSIS
Remidiation script for built-in Microsoft applications

.DESCRIPTION
Remidiates (unistalls) pre-defined default Microsoft applications.

.NOTES
To be used in the Endpoint Manager and as the remidiation script
#>

# List of Applications to Remove
$AppPackages  = @()
    $AppPackages += 'Microsoft.Xbox.TCUI'
    $AppPackages += 'Microsoft.XboxApp'
    $AppPackages += 'Microsoft.XboxGameOverlay'
	$AppPackages += 'Microsoft.XboxGamingOverlay'
    $AppPackages += 'Microsoft.XboxIdentityProvider'
    $AppPackages += 'Microsoft.XboxSpeechToTextOverlay'
    $AppPackages += 'Microsoft.GamingApp'
    $AppPackages += 'Microsoft.SkypeApp'
    $AppPackages += 'MicrosoftTeams'
    $AppPackages += 'Microsoft.ZuneMusic'
    $AppPackages += 'Microsoft.ZuneVideo'
    $AppPackages += 'Microsoft.WindowsFeedbackHub'
    $AppPackages += 'Microsoft.BingNews'
    $AppPackages += 'Microsoft.BingWeather'
    $AppPackages += 'Microsoft.MicrosoftSolitaireCollection'
    $AppPackages += 'Microsoft.WindowsMaps'
    $AppPackages += 'Microsoft.GetStarted'
    $AppPackages += 'Microsoft.People'
    $AppPackages += 'Microsoft.windowscommunicationsapps'
    $AppPackages += 'Microsoft.Messaging'
    $AppPackages += 'Microsoft.MixedReality.Portal'
    $AppPackages += 'Microsoft.YourPhone'
    $AppPackages += 'Microsoft.OneConnect'
	$AppPackages += 'Microsoft.GetHelp'
	$AppPackages += 'Microsoft.Microsoft3DViewer'
	$AppPackages += 'Microsoft.MicrosoftOfficeHub'
	$AppPackages += 'Microsoft.Office.OneNote'
	$AppPackages += 'Microsoft.Print3D'

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