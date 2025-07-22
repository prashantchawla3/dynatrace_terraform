resource "dynatrace_business_events_security_context" "this" {
  security_context_rule {
    query               = var.security_query
    rule_name           = var.rule_name
    value_source_field  = var.security_value_source_field
    value_source        = var.security_value_source
  }
}