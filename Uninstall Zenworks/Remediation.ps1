#Runs Uninstall
start-process -wait -filepath "c:\Program Files (x86)\Novell\ZENworks\bin\ZENworksUninstall.exe" -ArgumentList "-c","-d","-a","-q"

exit 0