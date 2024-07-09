module "skus" {

  source   = "../../"
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