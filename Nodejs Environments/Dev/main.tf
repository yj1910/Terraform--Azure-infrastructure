module "resource_group" {
    source = "../../Modules/Resource group"

    resource_group_name = var.resource_group_name
    location = var.location

    tags = var.tags
}

module "vnet" {
    source = "../../Modules/virtual network"

    # vnet will wait for resource group to be created first
    resource_group_name = module.resource_group.resource_group_name
    location = module.resource_group.location

    vnet_name = var.vnet_name
    address_space = var.address_space

    dns_servers = var.dns_servers
    subnets = var.subnets

    tags = var.tags
  
}