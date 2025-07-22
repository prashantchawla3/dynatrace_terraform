resource "dynatrace_xmatters_notification" "xmatters" {
  active   = var.xmatters_active
  name     = var.xmatters_name
  profile  = dynatrace_alerting.Default.id
  url      = var.xmatters_url
  insecure = var.xmatters_insecure
  payload  = var.xmatters_payload
  headers {
    header {
      name  = var.xmatters_header_name_01
      value = var.xmatters_header_value_01
    }
    header {
      name         = var.xmatters_header_name_02
      secret_value = var.xmatters_header_value_02
    }
  }
}