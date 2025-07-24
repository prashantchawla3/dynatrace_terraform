resource "dynatrace_oneagent_side_masking" "this" {
  for_each = {
    for r in var.oneagent_side_masking_resources : r.name => r
    if r.settings.oneagent_side_masking != null
  }

  is_email_masking_enabled     = each.value.settings.oneagent_side_masking.is_email_masking_enabled
  is_financial_masking_enabled = each.value.settings.oneagent_side_masking.is_financial_masking_enabled
  is_numbers_masking_enabled   = each.value.settings.oneagent_side_masking.is_numbers_masking_enabled
  is_query_masking_enabled     = each.value.settings.oneagent_side_masking.is_query_masking_enabled
}
