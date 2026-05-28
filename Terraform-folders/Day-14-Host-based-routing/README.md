# Azure Application Gateway + WAF Terraform

This repository deploys a modular Terraform-based infrastructure in Microsoft Azure with:

- Application Gateway (WAF_v2)
- Web Application Firewall (WAF)
- Host-based routing
- Virtual Network and Subnets
- Linux Virtual Machines
- Apache Web Servers
- NSG Security Rules

---

```powershell
Apply complete! Resources: 15 added, 0 changed, 0 destroyed.

Outputs:

application_gateway_public_ip = "52.140.121.220"
```

|Type|Name|Data|TTL|
|---|---|---|---|
|A|vm1|52.140.121.220|600 seconds|
|A|vm2|52.140.121.220|600 seconds|

```h
http://vm1.sneakertail.online
http://vm2.sneakertail.online
```
