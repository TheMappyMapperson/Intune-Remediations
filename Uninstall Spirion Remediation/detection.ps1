#Checks if Acrobat Exists
If ( Test-Path -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{4AD2CD6B-1EDD-445D-9F4D-06DC20293392}") {
	#Output to Intune that Acrobat Client Exists
	Write-Output "Client Exists."
	Exit 1

}
Else {
	#Output to Intune that Acrobat Client does not exist
	Write-Output "Client Does Not Exist."
	Exit 0
}