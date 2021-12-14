# Create a Image
# Per Image Version
$imageResourceGroup = 'RG-AzureImageBuilder'
$imageTemplateName = 'CoreITWin10ImageOnly'

#Start build asynchronously
Start-AzImageBuilderTemplate -ResourceGroupName $imageResourceGroup -Name $imageTemplateName -NoWait -PassThru