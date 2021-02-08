// Terraform Config Block
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

// Provider
provider "azurerm" {
  features {}
}

// Resource Group
resource "azurerm_resource_group" "example" {
  name     = "${var.pn}resources"
  location = var.location
}


// Virtual Network module
module "virtual_network" {
  source = "./vm"
  // variables passed down to child modules here
}

// Virtual Machines module
module "virtual_network" {
  source = "./vnet"
  // variables passed down to child modules here
}
