# Day 14 21-5-2026

## Host based routing

1. Create RG-1, VNET-1(10.0.0.0/16), SNET-1(10.0.0.0/24) delegate to AGW, SNET-2(10.0.1.0/24)
2. Create NSG for SNET-2 and open 80 from SNET-1, Create NAT-1 for SNET-2.
3. Create 2 VMs inside SNET-2 and Setup different web in both.
4. Create AGW-1 with WAF-1, 2 Routing Rules with 2 Listeners with both subdomains.
5. Add the subdomain record to godaddy with pip of AGW, [A,prefix,AGW Public IP] .

## Architecture

![alt text](<../images/Azure-resources-Host Based Routing.png>)

## Single region pattern

internet - AGW WAF - LB - VM / AKS / App Service

## Global Pattern

internet - Front Door WAF - Regional AGW - Backend Pools.
