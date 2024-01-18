#Checks if MBAM Client Exists
If ( Test-Path -Path "C:\Program Files\Microsoft\MDOP MBAM\MBAMAgent.exe" -PathType Leaf ) {
	#Output to Intune that MBAM Client Exists
	Write-Output "MBAM Client Exists."
	Exit 1

}
Else {
	#Output to Intune that MBAM Client does not exist
	Write-Output "MBMA Client Does Not Exist."
	Exit 0
}