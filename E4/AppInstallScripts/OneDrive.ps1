Write-Output 'OneDrive Start'
$BuildDir = 'c:\CustomizerArtifacts'
if (-not(Test-Path $BuildDir)) {
    New-Item  -ItemType Directory $BuildDir
}
$allVersions = Find-EvergreenApp -Name MicrosoftOneDrive | Get-EvergreenApp
$Ring = $allVersions | Where-Object { $_.Ring -eq 'Production'} | Sort-Object -Descending -Property 'Version'
$myVersion = $Ring | Where-Object { $_.Architecture -eq 'AMD64'}
$fileName = split-path $myVersion.uri -Leaf
$outFile = join-path 'c:\CustomizerArtifacts' $fileName
Invoke-WebRequest $myVersion.uri -OutFile $outFile
# $extPath = Join-Path  $BuildDir 'OneDrive'
Start-Process -FilePath (Join-Path $BuildDir "\OneDriveSetup.exe") -ArgumentList '/allusers' -Wait
Remove-Item $outFile
# Remove-Item $extPath -Recurse
Write-Output 'OneDrive Installed'