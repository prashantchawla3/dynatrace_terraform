resource "dynatrace_devobs_data_masking" "this" {
  enabled             = var.data_masking_enabled
  replacement_pattern = var.data_masking_replacement_pattern
  replacement_type    = var.data_masking_replacement_type
  rule_name           = var.data_masking_rule_name
  rule_type           = var.data_masking_rule_type
  rule_var_name       = var.data_masking_rule_var_name
}