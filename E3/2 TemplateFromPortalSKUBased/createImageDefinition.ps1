    $paramNewAzGalleryImageDefinition = @{
        GalleryName       = "CoreITImageGalleryAIB"
        ResourceGroupName = 'RG-AzureImageBuilder'
        Location          = 'westeurope'
        Name              = '21h1-evd-o365pp'
        OsState           = 'generalized'
        OsType            = 'Windows'
        Publisher         = 'MicrosoftWindowsDesktop'
        Offer             = 'office-365'
        Sku               = '21h1-evd-o365pp'
    }
    New-AzGalleryImageDefinition @paramNewAzGalleryImageDefinition