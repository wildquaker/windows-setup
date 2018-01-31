# Don't forget to run this first before executing this script
# PS> Set-ExecutionPolicy Unrestricted
# PS> ls -Recurse *.ps1 | Unblock-File
# PS> ls -Recurse *.psm1 | Unblock-File

Write-Output "Disabling services"

$services = "diagnosticshub.standardcollector.service","DiagTrack","dmwappushservice","HomeGroupListener","HomeGroupProvider","lfsvc","MapsBroker","NetTcpPortSharing","RemoteAccess","RemoteRegistry","SharedAccess","TrkWks","WbioSrvc","WMPNetworkSvc","wscsvc","XblAuthManager","XblGameSave","XboxNetApiSvc"

Foreach ($service in $services) {
    Write-Output "Trying to disable $app service"

    Get-Service -Name $service | Set-Service -StartupType Disabled
}