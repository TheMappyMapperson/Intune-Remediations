#Checks if Outlook Shortcut Exists
If ( Test-Path -Path "c:\windows.old" ) {
	#Output to Intune that Shortcut
	Write-Output "Folder Exists."
	Exit 1

}
Else {
	#Output to Intune that Outlook Shortcut does not exist
	Write-Output "Does Not Exist."
	Exit 0
}