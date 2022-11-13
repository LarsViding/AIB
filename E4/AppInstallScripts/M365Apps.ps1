# M365Apps
$allVersions = Find-EvergreenApp -Name Microsoft365Apps | Get-EvergreenApp
$myVersion = $allVersions | Where-Object { $_.Channel -eq 'MonthlyEnterprise'} 
$fileName = split-path $myVersion.uri -Leaf
$outFile = join-path 'c:\CustomizerArtifacts' $fileName
Invoke-WebRequest $myVersion.uri -OutFile $outFile
$XMLfileName = "https://raw.githubusercontent.com/LarsViding/AIB/main/E4/AppInstallScripts/annell-32bi-NO-teams-AVD.xml"
$outXML = Join-Path 'c:\CustomizerArtifacts' $XMLfileName
Invoke-WebRequest $myVersion.uri -OutFile $outFile

C:\CustomizerArtifacts\Setup.exe /download Annell-32bit-AVD.xml
C:\CustomizerArtifacts\Setup.exe /configure Annell-32bit-AVD.xml

$extPath = Join-Path  $BuildDir 'OneDrive'
Start-Process -FilePath (Join-Path $extPath "\Setup.exe") -ArgumentList '/allusers' -Wait
Remove-Item $outFile
Remove-Item $extPath -Recurse
Write-Output 'OneDrive Installed'