#Checks if Outlook Shortcut Exists
If ( Test-Path -Path "C:\Users\*\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outlook.lnk" -PathType Leaf ) {
	#Output to Intune that MBAM Client Exists
	Write-Output "Outlook Shortcut Exists."
	Exit 1

}
Else {
	#Output to Intune that Outlook Shortcut does not exist
	Write-Output "Outlook Shortcut Does Not Exist."
	Exit 0
}