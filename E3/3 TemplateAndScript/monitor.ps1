$imageResourceGroup = 'RG-AzureImageBuilder'
$imageTemplateName = 'MicrosoftWindowsDesktop.office-365.21h1-evd-o365pp'
while ($true) {
    Get-AzImageBuilderTemplate -ImageTemplateName  $imageTemplateName -ResourceGroupName $imageResourceGroup |
         Select-Object LastRunStatusRunState, LastRunStatusRunSubState, ProvisioningState, ProvisioningErrorMessage, LastRunStatusMessage
    Start-Sleep 5
    Clear-Host
}