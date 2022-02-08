provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev" {
  name     = "dev-resources"
  location = "Central US"
}

resource "azurerm_virtual_network" "VPC" {
  name                = "VPC-network"
  resource_group_name = azurerm_resource_group.dev.name
  location            = azurerm_resource_group.dev.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.dev.name
  virtual_network_name = azurerm_virtual_network.VPC.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = azurerm_resource_group.dev.name
  virtual_network_name = azurerm_virtual_network.VPC.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "subnet3" {
  name                 = "subnet3"
  resource_group_name  = azurerm_resource_group.dev.name
  virtual_network_name = azurerm_virtual_network.VPC.name
  address_prefixes     = ["10.0.3.0/24"]
}

# resource "azurerm_linux_virtual_machine_scale_set" "project" {
#   name                = "project-vmss"
#   resource_group_name = azurerm_resource_group.dev.name
#   location            = azurerm_resource_group.dev.location
#   sku                 = "Standard_F2"
#   instances           = 1
#   admin_username      = "adminjay"

#   admin_ssh_key {
#     username   = "adminjay"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "16.04-LTS"
#     version   = "latest"
#   }

#   os_disk {
#     storage_account_type = "Standard_LRS"
#     caching              = "ReadWrite"
#   }

#   network_interface {
#     name    = "example"
#     primary = true

#     ip_configuration {
#       name      = "internal"
#       primary   = true
#       subnet_id = azurerm_subnet.internal.id
#     }
    
#   }
