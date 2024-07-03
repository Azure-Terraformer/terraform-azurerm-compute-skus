output "all_disk_skus" {
  value = local.all_disk_skus
}
output "all_vm_skus" {
  value = [for sku in local.all_vm_skus : sku.name]
}
output "matching_vm_skus" {
  value = [for sku in local.matching_vm_skus : sku.name]
}