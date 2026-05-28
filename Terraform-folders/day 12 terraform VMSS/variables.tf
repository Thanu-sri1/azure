variable "location" {
  default = "Central India"
}

variable "resource_group_name" {
  default = "RG-1"
}

variable "vnet_name" {
  default = "VNET-1"
}

variable "subnet_name" {
  default = "SNET-1"
}

variable "nsg_name" {
  default = "NSG-1"
}

# ---

variable "public_ip_name" {
  default = "PIP-1"
}

variable "load_balancer_name" {
  default = "LB-1"
}

variable "backend_pool_name" {
  default = "BEPOOL-1"
}

variable "probe_name" {
  default = "PROBE-1"
}

variable "lb_rule_name" {
  default = "RULE-1"
}

# ---

variable "vmss_name" {
  default = "VMSS-1"
}

variable "admin_username" {
  default = "sinan"
}

variable "admin_password" {
  default = "Muhammed@2003"
}

# ---

variable "autoscale_name" {
  default = "AUTOSCALE-1"
}

# ---

variable "log_analytics_name" {
  default = "LAW-1"
}

variable "action_group_name" {
  default = "AG-1"
}

variable "cpu_alert_name" {
  default = "ALERT-CPU-1"
}

variable "alert_email" {
  default = "sinanlw95@gmail.com"
}