#Checks if MBAM Client Exists
If ( Test-Path -Path "C:\WINDOWS\syswow64\msxml4.dll" -PathType Leaf ) {
	#Output to Intune that MBAM Client Exists
	Write-Output "MSXML 4 Exists"
	Exit 1

}
Else {
	#Output to Intune that MBAM Client does not exist
	Write-Output "MSXML 4 Does Not Exist"
	Exit 0
}