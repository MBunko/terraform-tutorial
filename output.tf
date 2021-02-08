// Public IP Output
output "public_ip" {
  value = azurerm_linux_virtual_machine.example.public_ip_address
}

output "public_ip_proper" {
  value = azurerm_public_ip.example.ip_address
}

// Private IP Output
output "private_ip" {
  value = azurerm_linux_virtual_machine.example.private_ip_address 
}

// VM Name Output
output "vm_name" {
  value = azurerm_linux_virtual_machine.example.name
}

// Admin User Output
output "admin_user" {
  value = azurerm_linux_virtual_machine.example.admin_username
}
