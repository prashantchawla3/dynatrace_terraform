resource "dynatrace_api_token" "example" {
  api_name    = var.api_name
  enabled = var.enabled
  scopes  = var.scopes
}
