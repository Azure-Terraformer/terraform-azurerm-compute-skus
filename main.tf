data "azurerm_client_config" "current" {}

data "azapi_resource_action" "skus" {
  type                   = "Microsoft.Compute@2021-07-01"
  resource_id            = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/providers/Microsoft.Compute"
  action                 = "skus?api-version=2021-07-01&$filter=location%20eq%20'${var.location}'"
  method                 = "GET"
  response_export_values = ["*"]
}