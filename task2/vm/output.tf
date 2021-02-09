output "private_vm_ip" {
    value = azurerm_linux_virtual_machine.example2.private_ip_address
}

// VM Name Output
output "vm_name" {
  value = azurerm_linux_virtual_machine.example.name
}

// VM Name Output
output "vm_name_private" {
  value = azurerm_linux_virtual_machine.example2.name
}

// Admin User Output
output "admin_user" {
  value = azurerm_linux_virtual_machine.example.admin_username
}