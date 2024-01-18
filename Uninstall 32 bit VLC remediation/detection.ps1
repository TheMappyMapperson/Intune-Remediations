#Checks if Citrix 1912 Exists
If ( Test-Path -Path "C:\Program Files (x86)\VideoLAN\VLC\uninstall.exe") {
	#Output to Intune that Acrobat Client Exists
	Write-Output "Client Exists."
	Exit 1

}
Else {
	#Output to Intune that Acrobat Client does not exist
	Write-Output "Client Does Not Exist."
	Exit 0
}