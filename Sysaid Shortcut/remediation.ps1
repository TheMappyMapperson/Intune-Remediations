#Create Start Menu Shortcut
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Sysaid.lnk")
$Shortcut.TargetPath = "https://umd.sysaidit.com/"
#$Shortcut.WorkingDirectory = "C:\Program Files (x86)\reMarkable\"
#$Shortcut.Arguments="shell:AppsFolder\Microsoft.CompanyPortal_8wekyb3d8bbwe!App"
$shortcut.IconLocation = "%PUBLIC%\Pictures\Icons\Sysaid.ico"
$Shortcut.Save()

#Create Desktop Shortcut
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\users\public\desktop\Sysaid.lnk")
$Shortcut.TargetPath = "https://umd.sysaidit.com/"
#$Shortcut.WorkingDirectory = "C:\Program Files (x86)\reMarkable\"
#$Shortcut.Arguments="shell:AppsFolder\Microsoft.CompanyPortal_8wekyb3d8bbwe!App"
$shortcut.IconLocation = "%PUBLIC%\Pictures\Icons\Sysaid.ico"
$Shortcut.Save()

Exit 0