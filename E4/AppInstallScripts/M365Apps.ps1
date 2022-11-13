# M365Apps
Write-Output 'M365Apps Start'
$BuildDir = 'c:\CustomizerArtifacts'
if (-not(Test-Path $BuildDir)) {
    New-Item  -ItemType Directory $BuildDir
}
$allVersions = Find-EvergreenApp -Name Microsoft365Apps | Get-EvergreenApp
$myVersion = $allVersions | Where-Object { $_.Channel -eq 'MonthlyEnterprise'} 
$fileName = split-path $myVersion.uri -Leaf
$outFile = join-path 'c:\CustomizerArtifacts' $fileName
Invoke-WebRequest $myVersion.uri -OutFile $outFile

$XMLfileURI = "https://raw.githubusercontent.com/LarsViding/AIB/main/E4/AppInstallScripts/Annell-32bit-NO-teams-AVD.xml"
$XMLfileName = split-path $XMLfileURI -Leaf
$outXML = Join-Path 'c:\CustomizerArtifacts' $XMLfileName
Invoke-WebRequest $XMLfileURI -OutFile $outXML

C:\CustomizerArtifacts\Setup.exe /download Annell-32bit-NO-teams-AVD.xml
C:\CustomizerArtifacts\Setup.exe /configure Annell-32bit-NO-teams-AVD.xml

Start-Process -FilePath (Join-Path $BuildDir "\Setup.exe") /download Annell-32bit-NO-teams-AVD.xml -Wait
Start-Process -FilePath (Join-Path $BuildDir "\Setup.exe") /configure Annell-32bit-NO-teams-AVD.xml -Wait

Remove-Item $outFile
Remove-Item $outXML

Write-Output 'M365Apps Installed'