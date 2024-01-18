Remove-Item "C:\Users\*\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outlook.lnk"
#copy shortcut to desktop
Copy-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Outlook.lnk" -Destination "c:\users\public\desktop\"

Exit 0

#copy "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Outlook.lnk" "c:\users\public\desktop\"