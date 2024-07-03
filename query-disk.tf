locals {
  raw_disk_skus = [
    for sku in jsondecode(data.azapi_resource_action.skus.output).value : {
      name         = sku.name
      resourceType = sku.resourceType
      tier         = sku.tier
      size         = sku.size
      capabilities = {
        for capability in sku.capabilities :
        capability.name => capability.value
      }
    }
    if(sku.resourceType == "disks")
  ]
  all_disk_skus = [
    for sku in local.raw_disk_skus : {
      name             = sku.name
      resourceType     = sku.resourceType
      tier             = sku.tier
      size             = sku.size
      min_disk_size_gb = sku.capabilities["MinSizeGiB"]
      max_disk_size_gb = sku.capabilities["MaxSizeGiB"]
    }
  ]
}