resource "dynatrace_automation_controller_connections" "connections" {
  count = var.resource_count
  name  = var.resource_names[count.index]
  url   = var.url
  type  = var.type
  token = var.token
}
