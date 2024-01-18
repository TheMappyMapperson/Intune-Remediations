#Checks if  Exists
If ( Test-Path -Path "c:\users\public\desktop\sysaid.lnk") {
	#Output to Intune that Acrobat Client Exists
	Write-Output "Client Exists."
	Exit 0

}
Else {
	#Output to Intune that Acrobat Client does not exist
	Write-Output "Client Does Not Exist."
	Exit 1
}