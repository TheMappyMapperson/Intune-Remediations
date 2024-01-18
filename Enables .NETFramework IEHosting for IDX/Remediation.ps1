# Enables .NETFramework IEHosting 32-Bit and 64-Bit for IDX

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


# Set variables to indicate value and key to set
	$RegistryPath = 'HKLM:\Software\Microsoft\.NETFramework'
	$ValueName         = 'EnableIEHosting'
	$ValueData        = '1'
	$Type		  = 'DWORD'

# Call Function to test and set registry
	Set-RegistryEntrys $RegistryPath $ValueName $ValueData $Type



# Set variables to indicate value and key to set
	$RegistryPath = 'HKLM:\Software\WOW6432Node\Microsoft\.NETFramework'
	$ValueName         = 'EnableIEHosting'
	$ValueData        = '1'
	$Type		  = 'DWORD'

# Call Function to test and set registry
	Set-RegistryEntrys $RegistryPath $ValueName $ValueData $Type
