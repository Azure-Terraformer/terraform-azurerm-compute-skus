variable "location" {
  type        = string
  description = <<DESCRIPTION
  The Azure region for which to retrieve the list of SKUs.
  DESCRIPTION
}
variable "vm_filter" {
  type = object({
    resources = object({
      vcpu = object({
        min = optional(number, 0)
        max = optional(number, 9999)
      })
      memory_gb = object({
        min = optional(number, 0)
        max = optional(number, 999999)
      })
    })
  })
  default = {
    resources = {
      vcpu = {
        min = 0
        max = 9999
      }
      memory_gb = {
        min = 0
        max = 999999
      }
    }
  }
  description = <<DESCRIPTION
An object specifying filtering criteria for VM SKUs based on vCPU and memory requirements.

Attributes:
- `resources`: An object containing:
  - `vcpu`: An object containing:
    - `min` (number): Minimum number of vCPUs required.
    - `max` (number, optional): Maximum number of vCPUs allowed (default: 9999).
  - `memory_gb`: An object containing:
    - `min` (number): Minimum amount of memory (in GB) required.
    - `max` (number, optional): Maximum amount of memory (in GB) allowed (default: 999999).

Sample inputs:

1. Specifying only `vcpu.min`:

```
vm_filter = {
  resources = {
    vcpu = {
      min = 4
    }
  }
}
```

2. Specifying `vcpu.min`, `vcpu.max`, and `memory_gb.min`:

```
vm_filter = {
  resources = {
    vcpu = {
      min = 4
      max = 8
    }
    memory_gb = {
      min = 16
    }
  }
}
```

In both cases, the default values will be applied for any unspecified attributes (`vcpu.max` and `memory_gb.max`).

DESCRIPTION
}