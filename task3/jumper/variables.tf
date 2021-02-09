variable "resource_group_name" {}
variable "location" {}
variable "vmss_subnet_id" {}
variable "admin_user" {
    default     = "azureuser"
}

variable "admin_password" {}

variable "tags" {
  description = "A map of the tags to use for the resources that are deployed"
  type        = map(string)

  default = {
    environment = "vmss"
  }
}