# Install and use Evergreen 
# https://github.com/aaronparker/Evergreen
# https://stealthpuppy.com/evergreen/

Install-Module -Name Evergreen
Import-Module -Name Evergreen

# Find supported applications
Find-EvergreenApp -Name "Microsoft*"
Find-EvergreenApp -Name "Adobe*"
Find-EvergreenApp -Name "BISF*"
Find-EvergreenApp -Name "O365*"

# Using Evergreen
Get-EvergreenApp -Name "MicrosoftOneDrive"
Get-EvergreenApp -Name "MicrosoftFSLogixApps"
Get-EvergreenApp -Name "Microsoft365Apps"
Get-EvergreenApp -Name "MicrosoftWvdBootloader"
Get-EvergreenApp -Name "MicrosoftWvdInfraAgent"
Get-EvergreenApp -Name "AdobeAcrobatReaderDC"

$allVersions = Find-EvergreenApp -Name MicrosoftOneDrive | Get-EvergreenApp
$Ring = $allVersions | Where-Object { $_.Ring -eq 'Production'} | Sort-Object -Descending -Property 'Version'
$myVersion = $Ring | Where-Object { $_.Architecture -eq 'AMD64'}

MonthlyEnterprise

# M365Apps
$allVersions = Find-EvergreenApp -Name Microsoft365Apps | Get-EvergreenApp
$myVersion = $allVersions | Where-Object { $_.Channel -eq 'MonthlyEnterprise'} 

