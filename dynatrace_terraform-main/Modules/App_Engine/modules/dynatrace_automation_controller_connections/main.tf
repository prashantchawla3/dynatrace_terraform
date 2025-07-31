resource "dynatrace_automation_controller_connections" "connections" {
  count = var.automation_controller_count
  name  = var.automation_controller_names[count.index]
  url   = var.automation_controller_url
  type  = var.automation_controller_type
  token = var.automation_controller_token
}
