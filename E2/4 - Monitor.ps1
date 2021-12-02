# 4 - Monitor
$imageResourceGroup = 'RG-AzureImageBuilder'
$imageTemplateName = 'CoreITWin10Image'

$state = Get-AzImageBuilderTemplate -ImageTemplateName  $imageTemplateName -ResourceGroupName $imageResourceGroup
$state | Select-Object LastRunStatusRunState, LastRunStatusRunSubState, ProvisioningState, ProvisioningErrorMessage