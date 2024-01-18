#Checks if Acrobat Exists
If ( Test-Path -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{AC76BA86-7AD7-1033-7B44-AC0F074E4100}") {
	#Output to Intune that Acrobat Client Exists
	Write-Output "Client Exists."
	Exit 1

}
Else {
	#Output to Intune that Acrobat Client does not exist
	Write-Output "Client Does Not Exist."
	Exit 0
}