$timestamp = get-date -Format "MM/dd/yyyy"
set-adcomputer -Identity $env:computername -Description "Disabled by Automation $timestamp"
