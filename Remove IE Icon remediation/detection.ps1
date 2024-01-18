#Checks if MBAM Client Exists
If ( Test-Path -Path "C:\Users\Public\Desktop\Internet Explorer.lnk" -PathType Leaf ) {
	#Output to Intune that MBAM Client Exists
	Write-Output "IE Shortcut Exists."
	Exit 1

}
Else {
	#Output to Intune that MBAM Client does not exist
	Write-Output "IE Shortcut Does Not Exist."
	Exit 0
}