output "disks" {
  value = {
    names = {
      all      = [for sku in local.all_disk_skus : sku.name]
      matching = []
    }
    details = {
      all      = local.all_disk_skus
      matching = []
    }
  }
  description = <<DESCRIPTION
A complex object containing two lists of disk SKU names:
- 'all' for all available disk SKUs in the specified Azure region.
- 'matches' for disk SKUs that match the specified criteria.

Sample structure:
```
{
  names = {
    all = ["Standard_LRS", "StandardSSD_LRS", "Premium_LRS", ...]
    matches = ["StandardSSD_LRS", "Premium_LRS", ...]
  }
  details = {
    all = [ ... ]
    matches = [ ... ]
  }
}
```
DESCRIPTION
}

output "vms" {
  value = {
    names = {
      all      = [for sku in local.all_vm_skus : sku.name]
      matching = [for sku in local.matching_vm_skus : sku.name]
    }
    details = {
      all      = local.all_vm_skus
      matching = local.matching_vm_skus
    }
  }
  description = <<DESCRIPTION
A complex object containing two lists of VM SKU names:
- 'all' for all available VM SKUs in the specified Azure region.
- 'matches' for VM SKUs that match the specified minimum and maximum vCPU and memory requirements.

Sample structure:
```
{
  names = {
    all = ["Standard_B1ls", "Standard_B1ms", "Standard_D2s_v3", ...]
    matches = ["Standard_D2s_v3", "Standard_E2s_v3", ...]
  }
  details = {
    all = [ ... ]
    matches = [ ... ]
  }
}
```
DESCRIPTION

}