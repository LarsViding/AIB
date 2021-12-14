# Create VM Image definition and Image template
# Per Image SKU
# Create a gallery definition
$imageResourceGroup = 'RG-AzureImageBuilder'
$location = 'westeurope'
$imageDefName = 'CoreITImageForSIGWin10Only'
$myGalleryName = 'CoreITImageGalleryAIB'
$imageTemplateName = 'CoreITWin10ImageOnly'
$runOutputName = 'CoreITDistResults'
$identityNameResourceId = Get-Content C:\AzureDevOps-LarsViding\AIB-LV-1\identityNameId.txt

. C:\AzureDevOps-LarsViding\AIB-LV-1\Get-AzureImageInfo.ps1
$info = Get-AzureImageInfo -Location $location

$ParamNewAzGalleryImageDefinition = @{
    GalleryName       = $myGalleryName
    ResourceGroupName = $imageResourceGroup
    Location          = $location
    Name              = $imageDefName
    OsState           = 'generalized'
    OsType            = 'Windows'
    Publisher         = $info.Publisher
    Offer             = $info.Offer
    Sku               = $info.Sku
}

$imageDef = New-AzGalleryImageDefinition @ParamNewAzGalleryImageDefinition

#########################################
#
# Create an image Builder Template
#
#########################################

#Create an Azure image builder source object

$SrcObjParams = @{
    SourceTypePlatformImage = $true
    Publisher               = $info.Publisher
    Offer                   = $info.Offer
    Sku                     = $info.Sku
    Version                 = 'latest'
}
$srcPlatform = New-AzImageBuilderSourceObject @SrcObjParams

#Create an Azure image builder customization object.

$ImgCustomParams = @{
    PowerShellCustomizer = $true
    CustomizerName       = 'settingUpMgmtAgtPath'
    RunElevated          = $false
    Inline               = @("mkdir c:\\buildActions", "echo Azure-Image-Builder-Was-Here  > c:\\buildActions\\buildActionsOutput.txt")
}
$Customizer = New-AzImageBuilderCustomizerObject @ImgCustomParams

#Create an Azure image builder distributor object.

$disObjParams = @{
    SharedImageDistributor = $true
    ArtifactTag            = @{tag = 'CoreIT-AIB' }
    GalleryImageId         = $imageDef.Id
    ReplicationRegion      = $location
    RunOutputName          = $runOutputName
    ExcludeFromLatest      = $false
}
$disSharedImg = New-AzImageBuilderDistributorObject @disObjParams

#Create an Azure image builder template.

$ImgTemplateParams = @{
    ImageTemplateName      = $imageTemplateName
    ResourceGroupName      = $imageResourceGroup
    Source                 = $srcPlatform
    Distribute             = $disSharedImg
    Customize              = $Customizer
    Location               = $location
    UserAssignedIdentityId = $identityNameResourceId
}
New-AzImageBuilderTemplate @ImgTemplateParams