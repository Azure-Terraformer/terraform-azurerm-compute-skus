module "v1_0" {
  source   = "Azure-Terraformer/compute-skus/azurerm"
  version  = "1.0.0"
  location = "westus3"

  min_vcpu      = 4
  max_vcpu      = 4
  min_memory_gb = 8
}

output "v1_0" {
  value = module.v1_0.matching_vm_skus
}