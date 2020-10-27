// locals {

// }

// data "terraform_remote_state" "resource_group" {
//   backend = "local"

//   config = {
//     path = "${var.rspath_resource_group}/terraform.tfstate"
//   }
// }

module "resource_group" {
  source  = "krezreb/resource-group-data/azurerm"
  version = "1.0.0"
  resource_group_name = var.resource_group_name
  rspath_resource_group = var.rspath_resource_group
}

resource "azurerm_private_dns_zone" "this" {
  name                = var.name
  resource_group_name = module.resource_group.id
  tags = var.tags
}
