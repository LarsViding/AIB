# Install and use Evergreen 
# https://github.com/aaronparker/Evergreen
# https://stealthpuppy.com/evergreen/

Install-Module -Name Evergreen
Import-Module -Name Evergreen

# Find supported applications
Find-EvergreenApp -Name "Microsoft*"
Find-EvergreenApp -Name "Adobe*"

# Using Evergreen
Get-EvergreenApp -Name "MicrosoftOneDrive"
Get-EvergreenApp -Name "MicrosoftFSLogixApps"
Get-EvergreenApp -Name "Microsoft365Apps"
Get-EvergreenApp -Name "MicrosoftWvdBootloader"
Get-EvergreenApp -Name "MicrosoftWvdInfraAgent"
Get-EvergreenApp -Name "AdobeAcrobatReaderDC"

