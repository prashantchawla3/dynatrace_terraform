
# ─── DevOps Agent Opt-In ────────────────────────────────
module "agent_optin_scope" {
  source            = "./modules/dynatrace_devobs_agent_optin"
  agent_optin_scope = var.agent_optin_scope
}

module "agent_optin_enabled" {
  source             = "./modules/dynatrace_devobs_agent_optin"
  agent_optin_enabled = var.agent_optin_enabled
}

# ─── Data Masking Configuration ─────────────────────────
module "data_masking_enabled" {
  source               = "./modules/dynatrace_devobs_data_masking"
  data_masking_enabled = var.data_masking_enabled
}

module "data_masking_replacement_pattern" {
  source                          = "./modules/dynatrace_devobs_data_masking"
  data_masking_replacement_pattern = var.data_masking_replacement_pattern
}

module "data_masking_replacement_type" {
  source                        = "./modules/dynatrace_devobs_data_masking"
  data_masking_replacement_type = var.data_masking_replacement_type
}

module "data_masking_rule_name" {
  source                = "./modules/dynatrace_devobs_data_masking"
  data_masking_rule_name = var.data_masking_rule_name
}

module "data_masking_rule_type" {
  source                = "./modules/dynatrace_devobs_data_masking"
  data_masking_rule_type = var.data_masking_rule_type
}

module "data_masking_rule_var_name" {
  source                  = "./modules/dynatrace_devobs_data_masking"
  data_masking_rule_var_name = var.data_masking_rule_var_name
}

# ─── On-Prem Git Integration ────────────────────────────
module "git_onprem_provider" {
  source             = "./modules/dynatrace_devobs_git_onprem"
  git_onprem_provider = var.git_onprem_provider
}

module "git_onprem_url" {
  source         = "./modules/dynatrace_devobs_git_onprem"
  git_onprem_url = var.git_onprem_url
}
