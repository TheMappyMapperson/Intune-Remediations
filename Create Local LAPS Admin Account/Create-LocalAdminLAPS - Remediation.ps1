$localAdminName = "SurglapsAdmin"
$password = -join ((65..90) + (97..122) + (48..57) + (35..38) + (40..47) | Get-Random -Count 35 | ForEach-Object {[char]$_}) | ConvertTo-SecureString -AsPlainText -Force

New-LocalUser "$localAdminName" -Password $password -FullName "$localAdminName" -Description "LAPS account"
Add-LocalGroupMember -Group "Administrators" -Member "$localAdminName"

Exit 0
