#Checks if MSI Install Code Exists
If ( Test-Path -Path "HKLM:\SOFTWARE\Microsoft\DeviceManageabilityCSP") {
	#Output to Intune that Acrobat Client Exists
	Write-Output "Path Exists"
	Exit 1
}
Else {
	#Output to Intune that Acrobat Client does not exist
	Write-Output "Does Not Exist."
	Exit 0
}

