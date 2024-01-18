# Enables .NETFramework IEHosting 32-Bit and 64-Bit for IDX


$Path1 = "HKLM:\Software\Microsoft\.NETFramework"
$Path2 = "HKLM:\Software\WOW6432Node\Microsoft\.NETFramework"
$Name = "EnableIEHosting"
$Type = "DWORD"
$Value = "1"




Try {
    $Registry1 = Get-ItemProperty -Path $Path1 -Name $Name -ErrorAction Stop | Select-Object -ExpandProperty $Name
    $Registry2 = Get-ItemProperty -Path $Path2 -Name $Name -ErrorAction Stop | Select-Object -ExpandProperty $Name
    If (($Registry1 -eq $Value) -and ($Registry2 -eq $Value)){
        Write-Output "Compliant"
        Exit 0
    } 
    Write-Warning "Not Compliant"
    Exit 1
} 
Catch {
    Write-Warning "Not Compliant"
    Exit 1
}