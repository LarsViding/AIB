Write-Output 'Add Language sv-SE Start'
$LanguageList = Get-WinUserLanguageList
$LanguageList.Add("sv-SE")
Set-WinUserLanguageList $LanguageList
Write-Output 'Add Language sv-SE finished'