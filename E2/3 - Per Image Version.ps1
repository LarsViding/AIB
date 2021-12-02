# Per Image Version
$imageResourceGroup = 'RG-AzureImageBuilder'
$imageTemplateName = 'CoreITWin10Image'

#Start build asynchronously
Start-AzImageBuilderTemplate -ResourceGroupName $imageResourceGroup -Name $imageTemplateName -NoWait -PassThru