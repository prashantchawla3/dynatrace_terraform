

module "dynatrace_environment" {
  source = "./modules/dynatrace_environment"

  environment_name        = var.environment_name
  environment_state       = var.environment_state
  environment_trial       = var.environment_trial
  environment_tags        = var.environment_tags

  storage_transactions    = var.storage_transactions
  storage_user_actions    = var.storage_user_actions
  storage_limits          = var.storage_limits
  storage_retention       = var.storage_retention
  quotas                  = var.quotas
}
