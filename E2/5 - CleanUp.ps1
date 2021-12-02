# 5 - CleanUp
$imageResourceGroup = 'RG-AzureImageBuilder'
$imageTemplateName = 'CoreITWin10Image'

#CleanUp
Remove-AzImageBuilderTemplate -ImageTemplateName $imageTemplateName -ResourceGroupName $imageResourceGroup