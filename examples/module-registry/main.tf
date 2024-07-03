module "compute_skus" {
  source        = "Azure-Terraformer/compute-skus/azurerm"
  version       = "1.0.0"
  location      = "westus3"
  min_vcpu      = 4
  max_vcpu      = 4
  min_memory_gb = 8
}