resource "dynatrace_ops_genie_notification" "ops_genie" {
  active  = var.ops_genie_active
  name    = var.ops_genie_name
  profile = dynatrace_alerting.Default.id
  domain  = var.ops_genie_domain
  message = var.ops_genie_message
  api_key = var.ops_genie_api_key
}
