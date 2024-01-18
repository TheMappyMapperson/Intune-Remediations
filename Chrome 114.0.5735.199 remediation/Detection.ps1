# Detect if registry value exists
# Created 9/25/23 for upload into MEM
# Last edit/upload 9/25/23

# Create Function to test if the registry Value Exists
Function Test-RegistryValue ($RegistryPath, $ValueName, $ValueData) {
     if ((Get-ItemPropertyValue -Path $RegistryPath -Name $ValueName -ErrorAction Ignore) -lt $ValueData) {
         Write-Output 'Exists'
		 exit 1
     } else {
         Write-Output 'No Exists'
		 exit 0
     }
 }

	# Set variables to indicate value and key to set
	$RegistryPath = 'HKLM:\SOFTWARE\WOW6432Node\Google\Update\ClientState\{8A69D345-D564-463C-AFF1-A69D9E530F96}'
	$ValueName    = 'pv'
	$ValueData    = '115.0.5790.99'
	$Type		  = 'REG_SZ'
	
	# Call Function to test and set registry
	Test-RegistryValue $RegistryPath $ValueName $ValueData $Type
