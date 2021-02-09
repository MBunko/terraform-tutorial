variable "environment" {}
variable "location" {}
variable "resource_group_name" {}
variable "admin_password" {}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "jumpbox" {
    source = "../../jumper"
    vmss_subnet_id = module.vmss.vmss_subnet_id
    location = var.location
    admin_password = var.admin_password
    resource_group_name = var.resource_group_name

}

module "vmss" {
    source = "../../vmss"
    environment = var.environment
    location = var.location
    admin_password = var.admin_password
    resource_group_name = var.resource_group_name
}

output "vmss_public_ip" {
  value = module.vmss.vmss_public_ip
}

output "jp_public_ip" {
    value = module.jumpbox.jp_public_ip
}

output "admin_user" {
    value = module.jumpbox.admin_user
}