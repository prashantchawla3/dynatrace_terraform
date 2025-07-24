output "oneagent_side_masking_flags" {
  value = [
    for r in var.oneagent_side_masking_resources : {
      email_masking     = r.settings.oneagent_side_masking.is_email_masking_enabled
      financial_masking = r.settings.oneagent_side_masking.is_financial_masking_enabled
      numbers_masking   = r.settings.oneagent_side_masking.is_numbers_masking_enabled
      query_masking     = r.settings.oneagent_side_masking.is_query_masking_enabled
    }
  ]
}