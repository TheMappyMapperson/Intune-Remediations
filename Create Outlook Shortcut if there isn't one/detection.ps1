#Checks if Outlook Shortcut Exists
If ( Test-Path -Path "c:\users\public\desktop\Outlook*.lnk" -PathType Leaf ) {
	#Output to Intune that Shortcut
	Write-Output "Outlook Shortcut Exists."
	Exit 0

}
Else {
	#Output to Intune that Outlook Shortcut does not exist
	Write-Output "Outlook Shortcut Does Not Exist."
	Exit 1
}