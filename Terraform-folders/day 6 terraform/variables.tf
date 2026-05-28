variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  default     = "sinan-rg"
}

variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "Central India"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "sinan-vnet"
}

variable "vnet_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# ------------------------------------------------------------------

variable "public_subnet_name" {
  description = "The name of the public subnet"
  type        = string
  default     = "public-subnet"
}

variable "public_subnet_prefixes" {
  description = "The address prefixes for the public subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "public_ip_name" {
  description = "The name of the public IP address"
  type        = string
  default     = "public-ip"
}

variable "public_nic_name" {
  description = "The name of the public NIC"
  type        = string
  default     = "public-nic"
}

variable "public_vm_name" {
  description = "The name of the public VM"
  type        = string
  default     = "public-vm"
}

variable "public_nsg_name" {
  description = "The name of the public nsg"
  type = string
  default = "public-nsg"
}

# ---------------------------------------------

variable "private_subnet_name" {
  description = "The name of the private subnet"
  type        = string
  default     = "private-subnet"
}

variable "private_subnet_prefixes" {
  description = "The address prefixes for the private subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "private_nic_name" {
  description = "The name of the private NIC"
  type        = string
  default     = "private-nic"
}

variable "private_vm_name" {
  description = "The name of the private VM"
  type        = string
  default     = "private-vm"
}

variable "private_nsg_name" {
  description = "The name of the private nsg"
  type = string
  default = "private-nsg"
}

# ------------------------------------------------------------------

variable "vm_size" {
  description = "The size of the VM"
  type        = string
  default     = "Standard_B2ats_v2"
}

variable "vm_username" {
  description = "The username for the VM"
  type        = string
  default     = "sinan"
}

variable "vm_password" {
  description = "The password for the VM"
  type        = string
  # sensitive   = true
  default = "Muhammed@2003"
}

# ------------------------------------------------------------------

variable "nat_name" {
  description = "The name of the NAT gateway"
  type        = string
  default     = "nat-gateway"
}

variable "nat_ip_name" {
  description = "The name of the NAT gateway public IP"
  type        = string
  default     = "nat-ip"
}

# ------------------------------------------------------------------

variable "lb_public_ip_name" {
  description = "The name of the load balancer public IP"
  type        = string
  default     = "lb-public-ip"
}

variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
  default     = "lb"
}

variable "lb_backend_pool_name" {
  description = "The name of the load balancer backend address pool"
  type        = string
  default     = "lb-backend-pool"
}

variable "lb_health_probe_name" {
  description = "The name of the load balancer health probe"
  type        = string
  default     = "health-probe"
}

variable "lb_rule_name" {
  description = "The name of the LB rule"
  type = string
  default = "lb-rule"
}