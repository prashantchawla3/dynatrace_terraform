module "ag_token" {
  source          = "./modules/dynatrace_ag_token"
  type            = var.type
  expiration_date = var.expiration_date
  ag_name         = var.ag_name
}

module "api_token" {
  source  = "./modules/dynatrace_api_token"
  api_name = var.api_name
  enabled  = var.enabled
  scopes   = var.scopes
}

module "token_settings" {
  source           = "./modules/dynatrace_token_settings"
  new_token_format = var.new_token_format
  personal_tokens  = var.personal_tokens
}
