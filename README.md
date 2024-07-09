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
| <a name="input_location"></a> [location](#input\_location) | The Azure region for which to retrieve the list of SKUs. | `string` | n/a | yes |
| <a name="input_max_memory_gb"></a> [max\_memory\_gb](#input\_max\_memory\_gb) | The maximum amount of memory (in GB) allowed. | `number` | `999999` | no |
| <a name="input_max_vcpu"></a> [max\_vcpu](#input\_max\_vcpu) | The maximum number of virtual CPUs allowed. | `number` | `9999` | no |
| <a name="input_min_memory_gb"></a> [min\_memory\_gb](#input\_min\_memory\_gb) | The minimum amount of memory (in GB) required. | `number` | `0` | no |
| <a name="input_min_vcpu"></a> [min\_vcpu](#input\_min\_vcpu) | The minimum number of virtual CPUs required. | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_disks"></a> [disks](#output\_disks) | A map containing two lists of disk SKU names:<br>- 'all' for all available disk SKUs in the specified Azure region.<br>- 'matches' for disk SKUs that match the specified criteria. |
| <a name="output_vms"></a> [vms](#output\_vms) | A map containing two lists of VM SKU names:<br>- 'all' for all available VM SKUs in the specified Azure region.<br>- 'matches' for VM SKUs that match the specified minimum and maximum vCPU and memory requirements. |
<!-- END_TF_DOCS -->