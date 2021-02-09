variable "pn" {}
variable "resource_group" {}
variable "location" {}
variable "public_ni_id" {}
variable "private_ni_id" {}
// VM Size
variable "vm_size" {
    default = "Standard_B1ms"
}
