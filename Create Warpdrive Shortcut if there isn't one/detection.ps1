#Checks if Outlook Shortcut Exists
If ( Test-Path -Path "c:\users\public\desktop\Portfolio.lnk" -PathType Leaf ) {
	#Output to Intune that Shortcut
	Write-Output "Epic Shortcut Exists."
	Exit 0

}
Else {
	#Output to Intune that Outlook Shortcut does not exist
	Write-Output "Epic Shortcut Does Not Exist."
	Exit 1
}