variable "location" {
  type = string
}
variable "min_vcpu" {
  type    = number
  default = 0
}
variable "min_memory_gb" {
  type    = number
  default = 0
}
variable "max_vcpu" {
  type    = number
  default = 9999
}
variable "max_memory_gb" {
  type    = number
  default = 999999
}