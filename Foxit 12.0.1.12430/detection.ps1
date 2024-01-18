#Checks if file Exists - Exits with issue if does
If ( Test-Path -Path "C:\ProgramData\Package Cache\{b1ed9661-d22d-4fc1-8e33-661a0f6e0721}\GA_PDFEditor_AllLang_Online_Bundle_v12.0.1.12430.exe" -PathType Leaf ) {
	#Output to Intune that Shortcut
	Write-Output "File Exists."
	Exit 1

}
Else {
	#Output to Intune that file does not exist
	Write-Output "File Does Not Exist."
	Exit 0
}

#Checks if MSI Install Code Exists
#If ( Test-Path -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{AC76BA86-7AD7-1033-7B44-AC0F074E4100}") {
	#Output to Intune that Acrobat Client Exists
#	Write-Output "Client Exists."
#	Exit 1

#}
#Else {
#	#Output to Intune that Acrobat Client does not exist
#	Write-Output "Client Does Not Exist."
#	Exit 0
#}