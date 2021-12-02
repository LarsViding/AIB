$l = Get-Content -Path "C:\Users\larsv\Downloads\customization (9).log"
$out = $l | Where-Object { $_ -like "*PACKER OUT*"}
$out | Set-Content 'c:\AIB\packer.log'