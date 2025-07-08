terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.34.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = ">= 2.2.0"
    }
  }
}
