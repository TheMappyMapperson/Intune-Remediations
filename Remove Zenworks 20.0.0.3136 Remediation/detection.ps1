#Checks if MBAM Client Exists
If ( Test-Path -Path "C:\Program Files (x86)\Novell\ZENworks\ZeUS\lib\20.0.0.3136\log4j-1.3alpha-8.jar" -PathType Leaf ) {
	#Output to Intune that MBAM Client Exists
	Write-Output "Old Zen Folder Exists"
	Exit 1

}
Else {
	#Output to Intune that MBAM Client does not exist
	Write-Output "Old Zen Folder Does Not Exist."
	Exit 0
}