#Checks if Shortcut Exists
If ( Test-Path -Path "c:\users\public\desktop\Aquarius*.lnk" -PathType Leaf ) {
	#Output to Intune that Shortcut
	Write-Output "Shortcut Exists."
	Exit 0

}
Else {
	#Output to Intune that Outlook Shortcut does not exist
	Write-Output "Shortcut Does Not Exist."
	Exit 1
}