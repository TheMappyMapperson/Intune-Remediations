$localAdminName = "SurglapsAdmin"

if (Get-LocalUser | where-Object Name -eq $localAdminName){
    Write-Output "User does already exist"
    Exit 0
}
else {
    Write-Output "User does not exist"
    Exit 1
}
