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
  source = "./vnet"
  // variables passed down to child modules here
  resource_group = azurerm_resource_group.example.name
  location = var.location
  pn = var.pn

}

// Virtual machine module
module "virtual_machine" {
  source = "./vm"
  // variables passed down to child modules here
  resource_group = azurerm_resource_group.example.name
  location = var.location
  pn = var.pn
  public_ni_id=module.virtual_network.public_ni_id
  private_ni_id=module.virtual_network.private_ni_id
}