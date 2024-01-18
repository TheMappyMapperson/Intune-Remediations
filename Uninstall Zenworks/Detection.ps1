#Checks if ZENworks Agent Exists
If ( Test-Path -Path "c:\Program Files (x86)\Novell\ZENworks\bin\ZENworksUninstall.exe" -PathType Leaf ) {
	#Output to Intune that ZENworks Agent Exists
	Write-Output "ZENworks Agent Exists."
	Exit 1

}
Else {
	#Output to Intune that ZENworks Agent does not exist
	Write-Output "ZENworks Agent Does Not Exists."
	Exit 0
}