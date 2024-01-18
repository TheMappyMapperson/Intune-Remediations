#Create temp folder and copy installer over (folder is cleaned weekly)
#New-Item -ItemType Directory -Force -Path "c:\surgtemp\"
#remove-Item -Path "C:\Program Files (x86)\Foxit Software\Foxit PDF Editor\fpmkey.txt" -Recurse -Force

#Start Install Process - Wait until complete
start-process -wait -filepath "C:\ProgramData\Package Cache\{b1ed9661-d22d-4fc1-8e33-661a0f6e0721}\GA_PDFEditor_AllLang_Online_Bundle_v12.0.1.12430.exe" -ArgumentList "/uninstall /silent"
#Start-Process msiexec.exe -Wait -ArgumentList "/x {13E48B72-7B80-11EE-9CF8-54BF64A63C26} /qn"

Exit 0