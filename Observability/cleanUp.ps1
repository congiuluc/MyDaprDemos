# This will start the deletion of a resource group but not wait.

[CmdletBinding()]
param (
    [Parameter(
        Position = 0,
        HelpMessage = "The name of the resource group to be created. All resources will be place in the resource group and start with name."
    )]
    [string]
    $rgName = "dapr_observability_demo",

    [switch]
    $force
)

# Put the otel-local-config.yaml file back the way it was
git restore ./azureComponents/otel-local-config.yaml

if ($force.IsPresent) {
    az group delete --resource-group $rgName --no-wait --yes
}
else {
    az group delete --resource-group $rgName --no-wait
}