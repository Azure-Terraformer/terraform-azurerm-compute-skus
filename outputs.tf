output "disks" {
  value = {
    names = {
      all      = [for sku in local.all_disk_skus : sku.name]
      matching = []
    }
  }
  description = <<DESCRIPTION
A map containing two lists of disk SKU names:
- 'all' for all available disk SKUs in the specified Azure region.
- 'matches' for disk SKUs that match the specified criteria.
DESCRIPTION
}

output "vms" {
  value = {
    names = {
      all      = [for sku in local.all_vm_skus : sku.name]
      matching = [for sku in local.matching_vm_skus : sku.name]
    }
  }
  description = <<DESCRIPTION
A map containing two lists of VM SKU names:
- 'all' for all available VM SKUs in the specified Azure region.
- 'matches' for VM SKUs that match the specified minimum and maximum vCPU and memory requirements.
DESCRIPTION

}