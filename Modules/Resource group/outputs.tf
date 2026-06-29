output "resource_group_name" {
    description = "value"
    value = azurerm_resource_group.resource_group.name
  
}

output "location" {
    value = azurerm_resource_group.resource_group.location
  
}