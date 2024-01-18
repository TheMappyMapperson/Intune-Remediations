try  {
 
    Enable-WindowsOptionalFeature -Online -FeatureName NetFx4
    Write-Output 'NetFx4 will be Enabled'
    exit 0
}
catch {
 
    $errMsg = $_.Exception.Message
    Write-host $errMsg
    exit 1
}