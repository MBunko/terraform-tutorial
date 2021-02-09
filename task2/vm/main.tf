//Public

// Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "example" {
  name                = "${var.pn}-public-machine"
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.vm_size
  admin_username      = "micha"
  network_interface_ids = [
    var.public_ni_id,
  ]

  admin_ssh_key {
    username   = "micha"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}


//Private

// Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "example2" {
  name                = "${var.pn}private-machine"
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.vm_size
  admin_username      = "micha"
  network_interface_ids = [
    var.private_ni_id,
  ]

  admin_ssh_key {
    username   = "micha"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}