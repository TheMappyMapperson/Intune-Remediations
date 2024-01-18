# Delete Registry Entry
# Created 9/25/23 for upload into MEM
# Last edit/upload 9/25/23

# Create Function to test if the registry Value Exists
&"C:\Program Files\Google\Chrome\Application\115.0.5790.102\Installer\setup.exe" --uninstall --msi --system-level --verbose-logging --force-uninstall

Function Remove-RegistryValue ($RegistryPath, $ValueName) {
	Remove-ItemProperty -Path $RegistryPath -Name $ValueName
}


	# Set variables to indicate value and key to set
	$RegistryPath = 'HKLM:\SOFTWARE\WOW6432Node\Google\Update\ClientState\{8A69D345-D564-463C-AFF1-A69D9E530F96}'
	$ValueName    = 'pv'
	$Type		  = 'REG_SZ'
	
	# Call Function to test and set registry
	Remove-RegistryValue $RegistryPath $ValueName $ValueData $Type

	exit 0