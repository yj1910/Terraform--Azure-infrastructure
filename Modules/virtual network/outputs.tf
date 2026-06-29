output "vnet_name" {
    value = azurerm_virtual_network.vnet.name
}

output "vnet_id" {
    value = azurerm_virtual_network.vnet.id
  
}

output "subnet-ids" {
    value = { for k, v in azurerm_subnet.subnet : k => v.id }
  
}