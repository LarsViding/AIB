# Create a Image
# Per Image Version
$imageResourceGroup = 'RG-AzureImageBuilder'
# $imageTemplateName = 'CoreITWin10ImageOnly'
$imageTemplateName = 'CoreITWin10o365ppImage'

#Start build asynchronously
Start-AzImageBuilderTemplate -ResourceGroupName $imageResourceGroup -Name $imageTemplateName -NoWait -PassThru