#########################################
## Update Inbox Apps for Multi Language##
#########################################
##Set Inbox App Package Content Stores##
# this file is mounted to E "C:\install\language\Inbox Apps ISO\19041.928.210407-2138.vb_release_svc_prod1_amd64fre_InboxApps.iso"
[string] $AppsContent = "E:\"

##Update installed Inbox Store Apps##
foreach ($App in (Get-AppxProvisionedPackage -Online)) {
	$AppPath = $AppsContent + $App.DisplayName + '_' + $App.PublisherId
	Write-Host "Handling $AppPath"
	$licFile = Get-Item $AppPath*.xml
	if ($licFile.Count) {
		$lic = $true
		$licFilePath = $licFile.FullName
	} else {
		$lic = $false
	}
	$appxFile = Get-Item $AppPath*.appx*
	if ($appxFile.Count) {
		$appxFilePath = $appxFile.FullName
		if ($lic) {
			Add-AppxProvisionedPackage -Online -PackagePath $appxFilePath -LicensePath $licFilePath 
		} else {
			Add-AppxProvisionedPackage -Online -PackagePath $appxFilePath -skiplicense
		}
	}
}