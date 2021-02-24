variable "environment" {
  description = "Name of the environment"
  default = "DEV"
}

variable "location" {
  description = "Azure location to use"
  default = "eastus"
}

variable "vnet_name" {
  description = "Name of the base networking vnet"
  default = "test_vnet"
}

variable "bastion_name" {
  description = "Name of the bastion service"
  default = "bastion_01"
}