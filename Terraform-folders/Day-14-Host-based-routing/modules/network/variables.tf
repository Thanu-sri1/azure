variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "agw_subnet_name" {
  type = string
}

variable "agw_subnet_prefix" {
  type = list(string)
}

variable "vm_subnet_name" {
  type = string
}

variable "vm_subnet_prefix" {
  type = list(string)
}