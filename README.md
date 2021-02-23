## Terraform Module Sample

This repo shows a basic sample of leveraging modules to organize Terraform code; in this case, the deployment of the following services:

* Network layer, comprised of a VNET and 4 subnets
* Azure Bastion service, which is deployed into one of the above subnets.

Note this only is a demonstration of one possible way to decompose these deployment steps. 