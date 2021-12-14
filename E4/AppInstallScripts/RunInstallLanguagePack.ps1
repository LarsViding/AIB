# Run Install-LanguagePack
# https://github.com/JimMoyle/Install-LanguagePack

# LPtoFODFile "C:\install\language\Windows-10-1809-FOD-to-LP-Mapping-Table.csv"

# LanguageCode sv-se

# PathToLocalExperience E:\ this file is mounted on E "C:\install\language\Language ISO\19041.1.191206-1406.vb_release_CLIENTLANGPACKDVD_OEM_MULTI.iso"

# PathToFeaturesOnDemand I:\ this file is mounted on I "C:\install\language\LXP ISO\LanguageExperiencePack.2011C.iso"

#Run this funktion
C:\install\Install-LanguagePack.ps1

# install Swedish language pack
Install-LanguagePack -LanguageCode sv-se -PathToLocalExperience I:\ -PathToFeaturesOnDemand F:\ -LPtoFODFile C:\install\language\Windows-10-1809-FOD-to-LP-Mapping-Table.csv
