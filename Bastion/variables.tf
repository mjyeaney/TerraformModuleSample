variable "location" {
    description = "Location of the Bastion service"
}

variable "resource_group_name" {
    description = "Resource group for the Bastion service"
}

variable "pip_name" {
    description = "Name of the Bastion service public IP"
}

variable "bastion_name" {
    description = "Name of the Bastion service"
}

variable "subnet_id" {
    description = "The resource ID of the subnet to deploy in"
}