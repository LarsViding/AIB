Write-Output 'Start remove unneeded appx'

#Remove unneeded appx
$appname = @(
"*windowscommunicationsapps*"
"*officehub*"
"*xbox*"
"*music*"
"*Solitaire*"
"*mixed*"
"*OneConnect*"
"*BingWeather*"
"*GetHelp*"
"*Getstarted*"
"*Messaging*"
"*Print3D*"
"*SkypeApp*"
"*Microsoft.People*"
"*Wallet*"
"*Microsoft.Windows.Photos*"
"*WindowsAlarms*"
"*WindowsMaps*"
"*YourPhone*"
"*Zune*"
"*WindowsSoundRecorder*"
"*Microsoft3DViewer*"
)
ForEach($app in $appname){
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like $app} | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
}
Write-Output 'Finisched - Remove unneeded appx'
#Disable Internet Explorer
Write-Output 'Start Disable Internet Explorer'
Disable-WindowsOptionalFeature -FeatureName Internet-Explorer-Optional-amd64 -Online -NoRestart
Write-Output 'Finisched - Disable Internet Explorer'

#Finish up
Write-Output 'Finisched - adjustment of unneeded Apps'
