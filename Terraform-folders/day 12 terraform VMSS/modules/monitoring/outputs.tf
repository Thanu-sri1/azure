output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.law.name
}

output "action_group_name" {
  value = azurerm_monitor_action_group.action_group.name
}