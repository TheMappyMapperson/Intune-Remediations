<#
.SYNOPSIS
Detection script for built-in Microsoft applications

.DESCRIPTION
Checks if pre-defined default Microsoft applications are installed. If found then 'exit 1' is returned that informs
endpoint that 'errors' where found and that a connected remiditation script should be run.

.NOTES
To be used in the Endpoint Manager and as the detection script
#>

try
{
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
    $found = $false
	Write-Host "------- Detection Script - Uninstall Builtin Applications -------"

      foreach ($App In $AppPackages) 
    {
        $Package = Get-AppxPackage -AllUsers -PackageTypeFilter Main,Bundle,Resource,Framework | Where-Object {$_.Name -eq $App }
        $ProvisionedPackage = Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq $App}

        if ($null -ne $Package) 
		{
            Write-Host "+ AppX Package Found: $App"
	        $found = $true
        } 
		else 
		{
            Write-Host "+ AppX Package NOT Found: $App"
	    }
		
        if ($null -ne $ProvisionedPackage) 
		{
            Write-Host "+ Provision Package Found: $App"
            $found = $true
	    } 
		else 
		{
            Write-Host "+ Provisioned Package NOT Found: $App"
        }

        Write-Host ""
    }
	
    If ($found) 
    {
		Write-Host "Found packages, triggering remidation script"
        exit 1
    }
	Else 
	{
		Write-Host "No packages found"
		exit 0
	}
} 
catch
{
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}
finally {
Write-Host "------- END - Detection Script - Uninstall Builtin Applications -------"
}