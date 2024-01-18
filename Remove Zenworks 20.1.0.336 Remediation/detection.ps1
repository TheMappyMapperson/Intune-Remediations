#Checks if MBAM Client Exists
If ( Test-Path -Path "C:\Program Files (x86)\Novell\ZENworks\ZeUS\lib\20.1.0.336\log4j-core-2.16.0.jar" -PathType Leaf ) {
	#Output to Intune that MBAM Client Exists
	Write-Output "Old Zen Folder Exists"
	Exit 1

}
Else {
	#Output to Intune that MBAM Client does not exist
	Write-Output "Old Zen Folder Does Not Exist."
	Exit 0
}