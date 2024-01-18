# Misc registry changes for DOM Managed devices
# Created 5/19/2022 for upload into MEM
# Last edit/upload 5/19/2022

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
		Set-Itemproperty -path $RegistryPath -Name $ValueName -value $ValueData
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
	$RegistryPath = 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockdown'
	$ValueName    = 'bEnableFlash'
	$ValueData    = '0'
	$Type		  = 'DWORD'
	
	# Call Function to test and set registry
	Set-RegistryEntrys $RegistryPath $ValueName $ValueData $Type
	

	
# Defender - Disable JavaScript on Adobe Reader DC

	# Set variables to indicate value and key to set
	$RegistryPath = 'HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockdown'
	$ValueName         = 'bDisableJavaScript'
	$ValueData        = '1'
	$Type		  = 'DWORD'

	# Call Function to test and set registry
	Set-RegistryEntrys $RegistryPath $ValueName $ValueData $Type
	
# Defender - Disable JavaScript on Adobe Acrobat DC

	# Set variables to indicate value and key to set
	$RegistryPath = 'HKLM:\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown'
	$ValueName         = 'bDisableJavaScript'
	$ValueData        = '1'
	$Type		  = 'DWORD'

	# Call Function to test and set registry
	Set-RegistryEntrys $RegistryPath $ValueName $ValueData $Type
	
# Defender - Disable JavaScript on Adobe Acrobat 2020

	# Set variables to indicate value and key to set
	$RegistryPath = 'HKLM:\SOFTWARE\Policies\Adobe Acrobat\2020\FeatureLockDown'
	$ValueName         = 'bDisableJavaScript'
	$ValueData        = '1'
	$Type		  = 'DWORD'

	# Call Function to test and set registry
	Set-RegistryEntrys $RegistryPath $ValueName $ValueData $Type
	
# Defender - Disable the local storage of passwords and credentials

	# Set variables to indicate value and key to set
	$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa'
	$ValueName         = 'DisableDomainCreds'
	$ValueData        = '1'
	$Type		  = 'DWORD'

	# Call Function to test and set registry
	Set-RegistryEntrys $RegistryPath $ValueName $ValueData $Type

# Enables Toast Notifications for the Default Profile

	# Set variables to indicate value and key to set
	$RegistryPath = 'HKU:\.DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications'
	$ValueName         = 'ToastEnabled'
	$ValueData        = '1'
	$Type		  = 'DWORD'

	# Call Function to test and set registry
	Set-RegistryEntrys $RegistryPath $ValueName $ValueData $Type