#Checks if Java Exists
If ( Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{71124AE4-039E-4CA4-87B4-2F32180371F0}") {
	#Output to Intune that Acrobat Client Exists
	Write-Output "Client Exists."

	Exit 1

}
Else {
	#Output to Intune that Acrobat Client does not exist
	Write-Output "Client Does Not Exist."
	Exit 0
}