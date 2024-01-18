#Create temp folder and copy installer over (folder is cleaned weekly)
#New-Item -ItemType Directory -Force -Path "c:\surgtemp\"
remove-Item -Path "C:\zcmtemp\*" -Recurse -Force
remove-Item -Path "C:\zcmtemp\" -Recurse -Force

#Start Install Process - Wait until complete
#start-process -wait -filepath "c:\surgtemp\reMarkable-3.5.2.753-win32" -ArgumentList "in --al --da -c"
#Start-Process msiexec.exe -Wait -ArgumentList "/x {13E48B72-7B80-11EE-9CF8-54BF64A63C26} /qn"

Exit 0