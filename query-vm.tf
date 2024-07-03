locals {
  raw_vm_skus = [
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
    if(sku.resourceType == "virtualMachines")
  ]

  /*
"CachedDiskBytes" = "68719476736"
"CombinedTempDiskAndCachedIOPS" = "16000"
"CombinedTempDiskAndCachedReadBytesPerSecond" = "134217728"
"CombinedTempDiskAndCachedWriteBytesPerSecond" = "134217728"
"CpuArchitectureType" = "x64"
"HyperVGenerations" = "V1,V2"
"MaxResourceVolumeMB" = "180224"
"OSVhdSizeMB" = "1047552"
"SupportedEphemeralOSDiskPlacements" = "ResourceDisk,CacheDisk"
"UncachedDiskBytesPerSecond" = "192000000"
"UncachedDiskIOPS" = "12800"
"VMDeploymentTypes" = "IaaS"

"vCPUs" = "8"
"vCPUsAvailable" = "8"
"vCPUsPerCore" = "2"
"MemoryGB" = "28"
"GPUs" = "1"
"MaxDataDiskCount" = "16"
"MaxNetworkInterfaces" = "4"

"AcceleratedNetworkingEnabled" = "True"
"PremiumIO" = "True"
"RdmaEnabled" = "False"
"MemoryPreservingMaintenanceSupported" = "False"
"LowPriorityCapable" = "True"
"HibernationSupported" = "True"
"EncryptionAtHostSupported" = "True"
"EphemeralOSDiskSupported" = "True"
"CapacityReservationSupported" = "False"
*/

  all_vm_skus = [
    for sku in local.raw_vm_skus : {
      name         = sku.name
      resourceType = sku.resourceType
      tier         = sku.tier
      size         = sku.size
      resources = {
        vcpus           = tonumber(sku.capabilities["vCPUs"])
        vcpus_available = tonumber(sku.capabilities["vCPUsAvailable"])
        vcpus_per_core  = tonumber(sku.capabilities["vCPUsPerCore"])
        memory_gb       = tonumber(sku.capabilities["MemoryGB"])
        gpus            = tonumber(lookup(sku.capabilities, "GPUs", "0"))
        max_disk_count  = tonumber(sku.capabilities["MaxDataDiskCount"])
        max_nic_count   = tonumber(sku.capabilities["MaxNetworkInterfaces"])
      }
      features = {
        accelerated_networking        = sku.capabilities["AcceleratedNetworkingEnabled"] == "True"
        premium_io                    = sku.capabilities["PremiumIO"] == "True"
        rdma                          = sku.capabilities["RdmaEnabled"] == "True"
        memory_preserving_maintenance = sku.capabilities["MemoryPreservingMaintenanceSupported"] == "True"
        low_priority                  = sku.capabilities["LowPriorityCapable"] == "True"
        hibernation                   = lookup(sku.capabilities, "HibernationSupported", "False") == "True"
        encryption_at_host            = sku.capabilities["EncryptionAtHostSupported"] == "True"
        ephemeral_os_disk             = sku.capabilities["EphemeralOSDiskSupported"] == "True"
        capacity_reservation          = sku.capabilities["CapacityReservationSupported"] == "True"
      }
    }
  ]
  matching_vm_skus = [
    for sku in local.all_vm_skus : sku
    if(
      (sku.resources.vcpus >= var.min_vcpu && sku.resources.vcpus <= var.max_vcpu) &&
      (sku.resources.memory_gb >= var.min_memory_gb && sku.resources.memory_gb <= var.max_memory_gb)
    )
  ]
}