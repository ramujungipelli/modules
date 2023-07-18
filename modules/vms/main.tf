resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Static"
  # sku                 = "Standard"
  # routing_preference  = "Internet"
}

resource "azurerm_network_interface" "network_interface" {
  name                = var.network_interface
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name



  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id

  }
}

# resource "azurerm_network_interface_security_group_association" "nsg01" {
#   network_interface_id      = azurerm_network_interface.network_interface.id
#   network_security_group_id = azurerm_network_security_group.hubnsg01.id
# }

resource "azurerm_linux_virtual_machine" "ubuntu_linux_server" { # reference name in terrafom
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = var.vm_size
  admin_username      = var.username
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,

  ]
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.username
   # public_key = file("C:/Users/DELL/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}
