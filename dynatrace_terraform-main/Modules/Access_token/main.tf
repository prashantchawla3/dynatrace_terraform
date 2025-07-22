module "activegate_token" {
  source = "./modules/dynatrace_activegate_token"
  config = var.activegate_token_config
}

module "ag_token" {
  source = "./modules/dynatrace_ag_token"
  config = var.ag_token_config
}

module "api_token" {
  source = "./modules/dynatrace_api_token"
  config = var.api_token_config
}

module "token_settings" {
  source = "./modules/dynatrace_token_settings"
  config = var.token_settings_config
}
