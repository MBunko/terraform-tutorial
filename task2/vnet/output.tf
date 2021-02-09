output "public_ni_id" {
    value = azurerm_network_interface.example.id
}

output "private_ni_id" {
    value = azurerm_network_interface.example2.id
}

output "public_ip_proper" {
  value = azurerm_public_ip.example.ip_address
}