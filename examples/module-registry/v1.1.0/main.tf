
module "v1_1" {
  source   = "Azure-Terraformer/compute-skus/azurerm"
  version  = "1.1.0"
  location = "westus3"

  vm_filter = {
    resources = {
      vcpu = {
        min = 4
        max = 4
      }
      memory_gb = {
        min = 8
      }
    }
  }
}

output "v1_1" {
  value = module.v1_1.vms.names.matching
}