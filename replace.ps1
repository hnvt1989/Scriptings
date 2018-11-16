$configFiles = Get-ChildItem . *.spec.js -rec
foreach ($file in $configFiles) {
    (Get-Content $file.PSPath) -replace "Setup: ", "" -join "`n" | Set-Content $file.PSPath -NoNewline
}