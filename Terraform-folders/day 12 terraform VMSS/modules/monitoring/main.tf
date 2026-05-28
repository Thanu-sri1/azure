resource "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku               = "PerGB2018"
  retention_in_days = 30
}

resource "azurerm_monitor_action_group" "action_group" {
  name                = var.action_group_name
  resource_group_name = var.resource_group_name

  short_name = "alerts"

  email_receiver {
    name          = "email-alert"
    email_address = var.alert_email
  }
}

resource "azurerm_monitor_metric_alert" "cpu_alert" {
  name                = var.cpu_alert_name
  resource_group_name = var.resource_group_name

  scopes = [
    var.vmss_id
  ]

  description = "Alert when CPU usage is high"

  severity    = 2
  frequency   = "PT1M"
  window_size = "PT5M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachineScaleSets"

    metric_name = "Percentage CPU"

    aggregation = "Average"

    operator  = "GreaterThan"
    threshold = 70
  }

  action {
    action_group_id = azurerm_monitor_action_group.action_group.id
  }
}