variable "resource_group_name" {
    type = string
}

variable "location" {
    type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
    type = list(string)
    description = "VNet address space e.g. [\"10.0.0.0/16\"]"
}

variable "dns_servers" {
  type        = list(string) # ["10.0.0.4", "10.0.0.5"]  # your AD/custom DNS
  default     = []
  description = "Custom DNS servers. Empty = Azure default DNS"
}

variable "subnets" {
    type = map(object({
        address_prefixes = list(string)
        service_endpoints = optional(list(string), []) #service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"]
    
        delegation = optional(object({
            name         = string
            service_name = string
            actions      = list(string)
        }), null)         
    }))
    description = "Map of subnet name to config"
}



variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for the VNet"
}