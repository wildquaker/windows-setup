# Don't forget to run this first before executing this script
# PS> Set-ExecutionPolicy Unrestricted
# PS> ls -Recurse *.ps1 | Unblock-File
# PS> ls -Recurse *.psm1 | Unblock-File

$overwatchRegistryPath = "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Overwatch.exe\PerfOptions"

If (!(Test-Path $overwatchRegistryPath)) {
    New-Item -Path $overwatchRegistryPath -Force | Out-Null
}

New-ItemProperty -Path $overwatchRegistryPath -Name "CpuPriorityClass" -Value "00000003" -PropertyType DWORD -Force | Out-Null

$battleNetRegistryPath = "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Battle.net.exe\PerfOptions"

If (!(Test-Path $battleNetRegistryPath)) {
    New-Item -Path $battleNetRegistryPath -Force | Out-Null
}

New-ItemProperty -Path $battleNetRegistryPath -Name "CpuPriorityClass" -Value "00000005" -PropertyType DWORD -Force | Out-Null