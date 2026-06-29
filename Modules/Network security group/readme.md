What is NSG
NSG is a firewall at subnet level. It controls what traffic is allowed in and out.
Internet
    │
    ▼
NSG (snet-app)
    ├── Allow port 80  (HTTP)
    ├── Allow port 443 (HTTPS)
    ├── Deny everything else
    │
    ▼
snet-app (your VMs)
Without NSG — all traffic flows freely between subnets and internet. Not safe.

NSG Has Two Things
NSG
  ├── Security Rules   (allow/deny specific ports/IPs)
  └── Subnet Association  (which subnet this NSG protects)