# Don't forget to run this first before executing this script
# PS> Set-ExecutionPolicy Unrestricted
# PS> ls -Recurse *.ps1 | Unblock-File
# PS> ls -Recurse *.psm1 | Unblock-File

$wallpaperRegistryPath = "HKCU:\Control Panel\Desktop"

If (!(Test-Path $wallpaperRegistryPath)) {
    New-Item -Path $wallpaperRegistryPath -Force | Out-Null
}

New-ItemProperty -Path $wallpaperRegistryPath -Name "JPEGImportQuality" -Value "100" -PropertyType DWORD -Force | Out-Null