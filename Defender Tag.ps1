# Sets the Defender tag for DOM Managed devices
# Created 6/28/2022 for upload into MEM
# Last edit/upload 6/28/2022

# Create Function to test if the registry Value Exists
Function Test-RegistryValue ($RegistryPath, $ValueName) {
     if (Get-ItemProperty -Path $RegistryPath -Name $ValueName -ErrorAction Ignore) {
         $true
     } else {
         $false
     }
 }

# Create Function to test if the value exists then set or change as needed
Function Set-RegistryEntrys ($RegistryPath, $ValueName, $ValueData, $Type)  {
	# Create the key if it does not exist
	If (-NOT (Test-Path $RegistryPath)) {
		New-Item -Path $RegistryPath -Force | Out-Null
		}  
	# Set the Value data if the Value exists otherwise create the value and value data
	If (Test-RegistryValue $RegistryPath $ValueName) {
		Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData -Type $Type -Force
		}
	Else{
		New-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData -PropertyType $Type -Force
		}
	}

# Add HKEY_USERS to providers
New-PSDrive HKU Registry HKEY_USERS


# ***************************

# Defender - Disable Flash on Adobe Reader DC

	# Set variables to indicate value and key to set
	$RegistryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection\DeviceTagging'
	$ValueName    = 'Group'
	$ValueData    = 'SOM-Surgery'
	$Type		  = 'String'
	
	# Call Function to test and set registry
	Set-RegistryEntrys $RegistryPath $ValueName $ValueData $Type