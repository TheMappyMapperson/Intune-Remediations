#Create Start Menu Shortcut
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Portfolio.lnk")
$Shortcut.TargetPath = "C:\Program Files (x86)\Epic\WarpDrive\WarpDrive.exe"
$Shortcut.WorkingDirectory = "C:\Program Files (x86)\Epic\WarpDrive\"
$shortcut.IconLocation = "C:\Program Files (x86)\Epic\WarpDrive\WarpDrive.exe"
$Shortcut.Save()

#Create Desktop Shortcut
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\users\public\desktop\Portfolio.lnk")
$Shortcut.TargetPath = "C:\Program Files (x86)\Epic\WarpDrive\WarpDrive.exe"
$Shortcut.WorkingDirectory = "C:\Program Files (x86)\Epic\WarpDrive\"
$shortcut.IconLocation = "C:\Program Files (x86)\Epic\WarpDrive\WarpDrive.exe"
$Shortcut.Save()

Exit 0

#copy "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Outlook.lnk" "c:\users\public\desktop\"