module "agent_optin" {
  source = "./modules/dynatrace_devobs_agent_optin"

  agent_optin_scope   = var.agent_optin_scope
  agent_optin_enabled = var.agent_optin_enabled
}

module "data_masking" {
  source = "./modules/dynatrace_devobs_data_masking"

  data_masking_enabled             = var.data_masking_enabled
  data_masking_replacement_pattern = var.data_masking_replacement_pattern
  data_masking_replacement_type    = var.data_masking_replacement_type
  data_masking_rule_name           = var.data_masking_rule_name
  data_masking_rule_type           = var.data_masking_rule_type
  data_masking_rule_var_name       = var.data_masking_rule_var_name
}

module "git_onprem" {
  source = "./modules/dynatrace_devobs_git_onpren"

  git_onprem_provider = var.git_onprem_provider
  git_onprem_url      = var.git_onprem_url
}
