# terraform-azurerm-compute-sku
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.74.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | >= 1.9.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.74.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_resource_action.skus](https://registry.terraform.io/providers/azure/azapi/latest/docs/data-sources/resource_action) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure Region | `string` | n/a | yes |
| <a name="input_max_memory_gb"></a> [max\_memory\_gb](#input\_max\_memory\_gb) | n/a | `number` | `999999` | no |
| <a name="input_max_vcpu"></a> [max\_vcpu](#input\_max\_vcpu) | n/a | `number` | `9999` | no |
| <a name="input_min_memory_gb"></a> [min\_memory\_gb](#input\_min\_memory\_gb) | min memory | `number` | `0` | no |
| <a name="input_min_vcpu"></a> [min\_vcpu](#input\_min\_vcpu) | min cpu | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_disk_skus"></a> [all\_disk\_skus](#output\_all\_disk\_skus) | n/a |
| <a name="output_all_vm_skus"></a> [all\_vm\_skus](#output\_all\_vm\_skus) | n/a |
| <a name="output_matching_vm_skus"></a> [matching\_vm\_skus](#output\_matching\_vm\_skus) | n/a |
<!-- END_TF_DOCS -->