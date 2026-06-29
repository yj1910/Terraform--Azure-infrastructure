resource "azurerm_virtual_network" "vnet" {
    name = var.vnet_name
    location=var.location
    resource_group_name = var.resource_group_name
    
    address_space = var.address_space
    dns_servers   = var.dns_servers   # if it empty azurerm select this automaticaaly

    tags = var.tags
}

resource "azurerm_subnet" "subnet" {
    for_each = var.subnets

    name = each.key
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet.name

    address_prefixes = each.value.address_prefixes
    service_endpoints = each.value.service_endpoints #It creates a direct private route from your subnet to the Azure service:
   

    # only runs if delegation is provided it is optional per subnet(used in aks only)
    dynamic "delegation" {
    for_each = each.value.delegation != null ? [each.value.delegation] : []
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_name
        actions = delegation.value.actions
      }
    }
  }

}