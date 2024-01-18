# Full path of the folder
$folder = 'C:\zcmtemp'

#If the foler exist delete it
if (Test-Path -Path $folder) {Remove-Item -LiteralPath $folder -Force -Recurse}



# Full path of the folder
$folder = 'C:\temp'

#If the foler exist delete it
if (Test-Path -Path $folder) {Remove-Item -LiteralPath $folder -Force -Recurse}