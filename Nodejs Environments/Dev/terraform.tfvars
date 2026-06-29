resource_group_name = "terraform"
location = "eastus"
tags = {
  "env" = "Dev"
  "owner" = "yash"
}

#vnet
vnet_name = "terraforn_vnet"
address_space = [ "10.0.0.0/16" ]
dns_servers = [] # leave empty = Azure default DNS

#subnet
subnets = {
  "subnet_app" = {
    address_prefixes =["10.0.1.0/24"]
  }

  "subnet_db" = {
    address_prefixes = ["10.0.2.0/24"]
    service_endpoints = ["microsoft.sql", "microsoft.storage"]
  }
}