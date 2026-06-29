#resource group
variable "resource_group_name" {
    description = "resource group name"
    type = string
}

variable "location" {
    description = "value"
    type = string
}

variable "tags" {
    type = map(string)
}

#vnet
variable "vnet_name" {
    type = string
}
variable "address_space" {
    type = list(string)
}
variable "dns_servers" {
  type    = list(string)
  default = []
}

#subnet- name, address_prefix and service endpoint
variable "subnets" {
    type = map(object({
      address_prefixes = list(string)
      service_endpoints = optional(list(string),[])

      delegation = optional(object({
        name         = string
        service_name = string
        actions      = list(string)
        }), null) 
    }))
  
}
