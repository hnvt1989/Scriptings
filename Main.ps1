Set-StrictMode -Version 2.0

$global:ScriptLocation = $(get-location)

Write-host $global:ScriptLocation
if( (Test-Path "$global:ScriptLocation\deployment.ps1") -eq $False)
{
    Write-Error "Missing deployment.ps1"
    exit
}

if( (Test-Path "$global:ScriptLocation\ParsingSetting.ps1") -eq $False)
{
    Write-Error "Missing ParsingSetting.ps1"
    exit
}

if( (Test-Path "$global:ScriptLocation\PsService.exe") -eq $False)
{
    Write-Error "Missing PsService.exe"
    exit
}

if( (Test-Path "$global:ScriptLocation\deploy-settings.xml") -eq $False)
{
    Write-Error "Missing deploy-settings.xml"
    exit
}

. $global:ScriptLocation\ParsingSetting.ps1
. $global:ScriptLocation\deployment.ps1

pause
