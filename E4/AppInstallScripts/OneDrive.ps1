Write-Output 'OneDrive Start'
$BuildDir = 'c:\CustomizerArtifacts'
if (-not(Test-Path $BuildDir)) {
    New-Item  -ItemType Directory $BuildDir
}
$allVersions = Find-EvergreenApp -Name MicrosoftOneDrive | Get-EvergreenApp
$Ring = $allVersions | Where-Object { $_.Ring -eq 'Production'} | Sort-Object -Descending -Property 'Version'
$AMDVersion = $Ring | Where-Object { $_.Architecture -eq 'AMD64'}
$mostRecent = $AMDVersion | Sort-Object -Descending -Property 'Version' | Select-Object -First 1 | Select-Object -ExpandProperty 'Version'
$myVersion = $AMDVersion | Where-Object {$_.version -eq $mostRecent}
$fileName = split-path $myVersion.uri -Leaf
$outFile = join-path 'c:\CustomizerArtifacts' $fileName
Invoke-WebRequest $myVersion.uri -OutFile $outFile
# $extPath = Join-Path  $BuildDir 'OneDrive'
Start-Process -FilePath (Join-Path $BuildDir "\OneDriveSetup.exe") -ArgumentList '/allusers' -Wait
Remove-Item $outFile
# Remove-Item $extPath -Recurse
Write-Output 'OneDrive Installed'