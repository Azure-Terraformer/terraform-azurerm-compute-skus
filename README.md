# Azure Compute SKU Lookup Module
The Azure Compute SKU Lookup Module is a Terraform module designed to provide a list of available VM and disk SKUs for a specified Azure region. This module allows users to filter SKUs based on minimum and maximum values for virtual CPUs (vCPUs) and memory (in GB), enabling fine-grained control over the resources selected. By leveraging this module, users can dynamically retrieve and work with the most appropriate Azure SKUs that meet their specific requirements, facilitating efficient and optimized resource provisioning. The module is highly configurable and integrates seamlessly with existing Terraform configurations, making it an essential tool for Azure infrastructure management.

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
| <a name="input_vm_filter"></a> [vm\_filter](#input\_vm\_filter) | An object specifying filtering criteria for VM SKUs based on vCPU and memory requirements.<br><br>Attributes:<br>- `resources`: An object containing:<br>  - `vcpu`: An object containing:<br>    - `min` (number): Minimum number of vCPUs required.<br>    - `max` (number, optional): Maximum number of vCPUs allowed (default: 9999).<br>  - `memory_gb`: An object containing:<br>    - `min` (number): Minimum amount of memory (in GB) required.<br>    - `max` (number, optional): Maximum amount of memory (in GB) allowed (default: 999999).<br><br>Sample inputs:<br><br>1. Specifying only `vcpu.min`:<pre>vm_filter = {<br>  resources = {<br>    vcpu = {<br>      min = 4<br>    }<br>  }<br>}</pre>2. Specifying `vcpu.min`, `vcpu.max`, and `memory_gb.min`:<pre>vm_filter = {<br>  resources = {<br>    vcpu = {<br>      min = 4<br>      max = 8<br>    }<br>    memory_gb = {<br>      min = 16<br>    }<br>  }<br>}</pre>In both cases, the default values will be applied for any unspecified attributes (`vcpu.max` and `memory_gb.max`). | <pre>object({<br>    resources = object({<br>      vcpu = object({<br>        min = optional(number, 0)<br>        max = optional(number, 9999)<br>      })<br>      memory_gb = object({<br>        min = optional(number, 0)<br>        max = optional(number, 999999)<br>      })<br>    })<br>  })</pre> | <pre>{<br>  "resources": {<br>    "memory_gb": {<br>      "max": 999999,<br>      "min": 0<br>    },<br>    "vcpu": {<br>      "max": 9999,<br>      "min": 0<br>    }<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_disks"></a> [disks](#output\_disks) | A complex object containing two lists of disk SKU names:<br>- 'all' for all available disk SKUs in the specified Azure region.<br>- 'matches' for disk SKUs that match the specified criteria.<br><br>Sample structure:<pre>{<br>  names = {<br>    all = ["Standard_LRS", "StandardSSD_LRS", "Premium_LRS", ...]<br>    matches = ["StandardSSD_LRS", "Premium_LRS", ...]<br>  }<br>  details = {<br>    all = [ ... ]<br>    matches = [ ... ]<br>  }<br>}</pre> |
| <a name="output_vms"></a> [vms](#output\_vms) | A complex object containing two lists of VM SKU names:<br>- 'all' for all available VM SKUs in the specified Azure region.<br>- 'matches' for VM SKUs that match the specified minimum and maximum vCPU and memory requirements.<br><br>Sample structure:<pre>{<br>  names = {<br>    all = ["Standard_B1ls", "Standard_B1ms", "Standard_D2s_v3", ...]<br>    matches = ["Standard_D2s_v3", "Standard_E2s_v3", ...]<br>  }<br>  details = {<br>    all = [ ... ]<br>    matches = [ ... ]<br>  }<br>}</pre> |
<!-- END_TF_DOCS -->