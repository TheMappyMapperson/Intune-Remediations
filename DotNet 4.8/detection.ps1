Start-Transcript -Path $(Join-Path $env:temp "NetFx4.log")
 
if ((Get-WindowsOptionalFeature -Online -FeatureName NetFx4).State -eq "Enabled") {
    Write-Output 'NetFx3 Enabled'
    exit 0
}
else {
    Write-Output 'NetFx3 Disabled'
    exit 1
}