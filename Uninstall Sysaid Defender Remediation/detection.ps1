#Checks if Acrobat Exists
If ( Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{F92FB2E1-AB34-42DD-99F4-9C4A54E1381B}") {
	#Output to Intune that Acrobat Client Exists
	Write-Output "Client Exists."
	Exit 1

}
Else {
	#Output to Intune that Acrobat Client does not exist
	Write-Output "Client Does Not Exist."
	Exit 0
}