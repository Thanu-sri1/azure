resource "azurerm_public_ip" "agw_pip" {
  name                = "PIP-AGW"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_web_application_firewall_policy" "waf_policy" {
  name                = "WAF-POLICY-1"
  location            = var.location
  resource_group_name = var.resource_group_name

  policy_settings {
    enabled = true
    mode    = var.waf_mode
  }

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
    }
  }
}

resource "azurerm_application_gateway" "agw" {
  name                = "AGW-1"
  location            = var.location
  resource_group_name = var.resource_group_name
  firewall_policy_id  = azurerm_web_application_firewall_policy.waf_policy.id

  sku {
    name = "WAF_v2"
    tier = "WAF_v2"
  }

  autoscale_configuration {
    min_capacity = 1
    max_capacity = 2
  }

  gateway_ip_configuration {
    name      = "gateway-ip-config"
    subnet_id = var.agw_subnet_id
  }

  frontend_port {
    name = "frontend-port-80"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontend-ip-config"
    public_ip_address_id = azurerm_public_ip.agw_pip.id
  }

  backend_address_pool {
    name = "pool1"
    ip_addresses = [ var.backend_ip_addresses[0] ]
  }

  backend_address_pool {
    name = "pool2"
    ip_addresses = [ var.backend_ip_addresses[1] ]
  }

  backend_http_settings {
    name                  = "http-setting"
    cookie_based_affinity = "Disabled"

    port     = 80
    protocol = "Http"

    request_timeout = 30

    probe_name = "health-probe"
  }

  probe {
    name = "health-probe"

    protocol = "Http"

    host = "127.0.0.1"

    path = "/"

    interval            = 30
    timeout             = 30
    unhealthy_threshold = 3
  }

  http_listener {
    name = "listener-vm1"

    frontend_ip_configuration_name = "frontend-ip-config"
    frontend_port_name             = "frontend-port-80"

    protocol = "Http"

    host_name = "vm1.${var.domain_name}"
  }

  http_listener {
    name = "listener-vm2"

    frontend_ip_configuration_name = "frontend-ip-config"
    frontend_port_name             = "frontend-port-80"

    protocol = "Http"

    host_name = "vm2.${var.domain_name}"
  }

  request_routing_rule {
    name                       = "rule-vm1"
    rule_type                  = "Basic"

    http_listener_name         = "listener-vm1"

    backend_address_pool_name  = "pool1"
    backend_http_settings_name = "http-setting"

    priority = 100
  }

  request_routing_rule {
    name                       = "rule-vm2"
    rule_type                  = "Basic"

    http_listener_name         = "listener-vm2"

    backend_address_pool_name  = "pool2"
    backend_http_settings_name = "http-setting"

    priority = 110
  }
}