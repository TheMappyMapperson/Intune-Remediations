$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "MDOP MBAM"}
$MyApp.Uninstall()

Exit 0