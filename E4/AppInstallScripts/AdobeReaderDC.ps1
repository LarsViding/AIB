# Install Adobe Reader DC
Write-Output 'Adobe Reader DC Start'
$BuildDir = 'c:\CustomizerArtifacts'
if (-not(Test-Path $BuildDir)) {
    New-Item  -ItemType Directory $BuildDir
}
$myVersion = Find-EvergreenApp -Name AdobeAcrobatReaderDC | Get-EvergreenApp | Where-Object { $_.Language -eq "Swedish" -and $_.Architecture -eq "x64" }
$fileName = split-path $myVersion.uri -Leaf
$outFile = join-path 'c:\CustomizerArtifacts' $fileName
if (-not(Test-Path $outFile)) {
    Invoke-WebRequest $myVersion.uri -OutFile $outFile
}
Start-Process -FilePath $outFile -Argument '-install -quiet -norestart' -Wait
Remove-Item $outFile
Write-Output 'Adobe Reader DC Installed'