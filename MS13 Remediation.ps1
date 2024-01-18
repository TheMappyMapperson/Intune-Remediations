New-Item -Path HKLM:\Software\Wow6432Node\Microsoft\Cryptography\Wintrust\Config -ItemType Container -Force -ErrorAction Stop

New-ItemProperty -Path HKLM:\Software\Wow6432Node\Microsoft\Cryptography\Wintrust\Config -Name EnableCertPaddingCheck -Value 1 -PropertyType String -ErrorAction Stop

New-Item -Path HKLM:\Software\Microsoft\Cryptography\Wintrust\Config -ItemType Container -Force -ErrorAction Stop

New-ItemProperty -Path HKLM:\Software\Microsoft\Cryptography\Wintrust\Config -Name EnableCertPaddingCheck -Value 1 -PropertyType String -ErrorAction Stop

Exit 0