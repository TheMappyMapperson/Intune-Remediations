# List of Applications that will be removed
 
$AppsList = 
"Microsoft.3DBuilder",
"Microsoft.Wallet",
"Microsoft.BingWeather",
#"Microsoft.DesktopAppInstaller",
"Microsoft.GetHelp",
"Microsoft.Getstarted",
"Microsoft.Messaging",
"Microsoft.Microsoft3DViewer",
"Microsoft.MicrosoftOfficeHub",
"Microsoft.MicrosoftSolitaireCollection",
#"Microsoft.MicrosoftStickyNotes",
#"Microsoft.MSPaint",
"Microsoft.Office.OneNote",
"Microsoft.OneConnect",
"Microsoft.SkypeApp",
#"Microsoft.People",
"Microsoft.Print3D",
#"Microsoft.StorePurchaseApp",
#"Microsoft.Windows.Photos",
#"Microsoft.WindowsAlarms",
#"Microsoft.WindowsCalculator",
#"Microsoft.WindowsCamera",
"microsoft.windowscommunicationsapps",
"Microsoft.WindowsFeedbackHub",
#"Microsoft.WindowsMaps",
#"Microsoft.WindowsSoundRecorder",
#"Microsoft.WindowsStore",
"Microsoft.Xbox.TCUI",
"Microsoft.XboxApp",
"Microsoft.XboxGameOverlay",
"Microsoft.XboxIdentityProvider",
"Microsoft.XboxSpeechToTextOverlay",
"Microsoft.ZuneMusic",
"Microsoft.ZuneVideo",
"MicrosoftTeams"
  

ForEach ($App in $AppsList)
 
{

$Packages = Get-AppxPackage | Where-Object {$_.Name -eq $App}

if ($Packages -ne $null)


{
      Write-Host "Removing Appx Package: $App"

      foreach ($Package in $Packages)
      {
      Remove-AppxPackage -package $Package.PackageFullName
      }
}
 
else

{
      Write-Host "Unable to find package: $App"

}

$ProvisionedPackage = Get-AppxProvisionedPackage -online | Where-Object {$_.displayName -eq $App}
 

if ($ProvisionedPackage -ne $null)

{
      Write-Host "Removing Appx Provisioned Package: $App"
      remove-AppxProvisionedPackage -online -packagename $ProvisionedPackage.PackageName

}

else
 
{
      Write-Host "Unable to find provisioned package: $App"
}
 
}
