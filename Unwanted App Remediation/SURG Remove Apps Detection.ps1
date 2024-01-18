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