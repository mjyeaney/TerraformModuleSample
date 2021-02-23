
resource "azurerm_virtual_network" "vnet01" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  
  tags = {
    environment = var.environment
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "subnet3" {
  name                 = "subnet3"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_subnet" "bastion" {
  name                = "AzureBastionSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = ["10.0.4.0/24"]
}