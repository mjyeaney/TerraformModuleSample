provider "azurerm" {
  version = "~> 2.48.0"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "tf-ref-${var.environment}-rg"
  location = var.location
}

module "base_networking" {
  source                      = "./Networking"
  environment                 = var.environment
  location                    = var.location
  vnet_name                   = var.vnet_name
  resource_group_name         = azurerm_resource_group.rg.name
}

module "bastion_service" {
  source                      = "./Bastion"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.rg.name
  bastion_name                = var.bastion_name
  subnet_id                   = module.base_networking.vnet_bastionsubnet_id
}

module "web_server" {
  source                      = "./WebServer"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.rg.name
  environment                 = var.environment
  subnet_id                   = module.base_networking.vnet_subnet1_id
}