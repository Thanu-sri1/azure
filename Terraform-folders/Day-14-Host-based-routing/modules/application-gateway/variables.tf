variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "agw_subnet_id" {
  type = string
}

variable "backend_ip_addresses" {
  type = list(string)
}

variable "waf_mode" {
  type = string
}

variable "domain_name" {
  type = string
}