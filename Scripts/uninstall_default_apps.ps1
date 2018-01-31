# Don't forget to run this first before executing this script
# PS> Set-ExecutionPolicy Unrestricted
# PS> ls -Recurse *.ps1 | Unblock-File
# PS> ls -Recurse *.psm1 | Unblock-File

Write-Output "Uninstall default apps"

$defaultApps = "Microsoft.BingWeather","Microsoft.GetHelp","Microsoft.Getstarted","Microsoft.Messaging","Microsoft.Microsoft3DViewer","Microsoft.MicrosoftOfficeHub","Microsoft.MicrosoftSolitaireCollection","Microsoft.MicrosoftStickyNotes","Microsoft.MSPaint","Microsoft.Office.OneNote","Microsoft.OneConnect","Microsoft.People","Microsoft.Print3D","Microsoft.SkypeApp","Microsoft.Wallet","Microsoft.Windows.Photos","Microsoft.WindowsAlarms","Microsoft.WindowsCamera","microsoft.windowscommunicationsapps","Microsoft.WindowsFeedbackHub","Microsoft.WindowsMaps","Microsoft.WindowsSoundRecorder","Microsoft.Xbox.TCUI","Microsoft.XboxApp","Microsoft.XboxGameOverlay","Microsoft.XboxIdentityProvider","Microsoft.XboxSpeechToTextOverlay","Microsoft.ZuneMusic","Microsoft.ZuneVideo"

Foreach ($app in $defaultApps) {
    Write-Output "Trying to remove $app"

    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers

    Get-AppXProvisionedPackage -Online | Where-Object DisplayName -EQ $app | Remove-AppxProvisionedPackage -Online
}

mkdir -Force "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content"
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content" "DisableWindowsConsumerFeatures" 1