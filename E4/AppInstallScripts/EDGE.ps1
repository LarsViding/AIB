# EDGE
Write-Output 'EDGE Start'
$BuildDir = 'c:\CustomizerArtifacts'
if (-not(Test-Path $BuildDir)){
    New-Item -ItemType Directory $BuildDir
}
$myVersion = Get-EvergreenApp -Name MicrosoftEdge | Where-Object { $_.Architecture -eq "x64" -and $_.Channel -eq "Stable" -and $_.Release -eq "Enterprise"}
$fileName = split-path $myVersion.uri -Leaf
$outFile = join-path 'c:\CustomizerArtifacts' $fileName
if (-not(Test-Path $outFile)) {
    Invoke-WebRequest $myVersion.uri -OutFile $outFile
}
Start-Process -FilePath msiexec.exe -Argument "/i $outFile /quiet /norestart ALLUSER=1 ALLUSERS=1" -Wait
Remove-Item $outFile
Write-Output 'EDGE Installed'