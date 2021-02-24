provider "azurerm" {
  version = "~> 2.48.0"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "tf-ref-${var.environment}-rg"
  location = var.location
}

module "base_networking" {
  source                           = "./Networking"
  environment                      = var.environment
  location                         = var.location
  vnet_name                        = "test_vnet"
  resource_group_name = azurerm_resource_group.rg.name

  providers = {
    azurerm : azurerm
  }

  depends_on = [azurerm_resource_group.rg]
}

module "bastion_service" {
  source                      = "./Bastion"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.rg.name
  pip_name                    = "bastion_pip_01"
  bastion_name                = "bastion_01"
  subnet_id                   = module.base_networking.vnet_bastionsubnet_id

  providers = {
    azurerm : azurerm
  }

  depends_on = [azurerm_resource_group.rg]
}

module "web_server" {
  source                      = "./WebServer"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.rg.name
  environment                 = var.environment
  subnet_id                   = module.base_networking.vnet_subnet1_id

  providers = {
    azurerm : azurerm
  }

  depends_on = [azurerm_resource_group.rg]
}