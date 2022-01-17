Write-Output 'Add Language sv-SE Start'
$LanguageList = Get-WinUserLanguageList
$EnUsTag = $LanguageList.LanguageTag
# $EnUsTag = "en-us"
$LanguageList.Add("sv-SE")
$SvSeTag = "sv-se"
# Set-WinUserLanguageList $LanguageList -Force
Set-WinUserLanguageList $SvSeTag,$EnUsTag  -Force
Write-Output 'Add Language sv-SE finished'