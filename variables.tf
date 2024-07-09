variable "location" {
  type        = string
  description = "The Azure region for which to retrieve the list of SKUs."
}
variable "min_vcpu" {
  type        = number
  default     = 0
  description = "The minimum number of virtual CPUs required."
}
variable "max_vcpu" {
  type        = number
  default     = 9999
  description = "The maximum number of virtual CPUs allowed."
}
variable "min_memory_gb" {
  type        = number
  default     = 0
  description = "The minimum amount of memory (in GB) required."
}
variable "max_memory_gb" {
  type        = number
  default     = 999999
  description = "The maximum amount of memory (in GB) allowed."
}