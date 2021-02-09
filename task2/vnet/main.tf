// Virtual Network
resource "azurerm_virtual_network" "example" {
  name                = "${var.pn}network"
  resource_group_name = var.resource_group
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}
//Public

// Subnet
resource "azurerm_subnet" "example" {
  name                 = "Public"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

// Public IP
resource "azurerm_public_ip" "example" {
  name                = "PublicIp"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}

// Network Security Group
resource "azurerm_network_security_group" "example" {
  name                = "publicsec"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "Allow"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

// Network Interface/NSG Group Association

resource "azurerm_network_interface" "example" {
  name                = "${var.pn}-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.example.id
  network_security_group_id = azurerm_network_security_group.example.id
}

//private

// Subnet
resource "azurerm_subnet" "example2" {
  name                 = "private"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.3.0/24"]
}



// Network Security Group
resource "azurerm_network_security_group" "example2" {
  name                = "SecurityGrou2"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "Noallow"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.0.2.0/24"
    destination_address_prefix = "10.0.3.0/24"
  }

  tags = {
    environment = "Production"
  }
}

// Network Interface/NSG Group Association

resource "azurerm_network_interface" "example2" {
  name                = "private-nic2"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example2.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "example2" {
  network_interface_id      = azurerm_network_interface.example2.id
  network_security_group_id = azurerm_network_security_group.example2.id
}
