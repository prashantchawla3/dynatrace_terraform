resource "dynatrace_victor_ops_notification" "victor_ops" {
  active      = var.victor_ops_active
  name        = var.victor_ops_name
  profile     = dynatrace_alerting.Default.id
  api_key     = var.victor_ops_api_key
  routing_key = var.victor_ops_routing_key
  message     = var.victor_ops_message
}
