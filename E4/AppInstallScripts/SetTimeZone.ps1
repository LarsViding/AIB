# Set time Zone
# $tz = Get-TimeZone -ListAvailable |Out-Gridview -Outputmode Single
# Set-TimeZone -ID $tz.Id

$TimeZoneID ="W. Europe Standard Time"
Set-TimeZone -ID $TimeZoneID