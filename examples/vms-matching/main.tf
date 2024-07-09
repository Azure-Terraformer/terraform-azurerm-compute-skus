module "skus" {
  source        = "../../"
  location      = "westus3"
  min_vcpu      = 4
  max_vcpu      = 4
  min_memory_gb = 8
}