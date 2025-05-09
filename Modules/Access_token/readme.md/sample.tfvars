
activegate_token_config = {
  auth_token_enforcement_manually_enabled = false
  expiring_token_notifications_enabled    = true
}

ag_token_config = {
  type            = "ENVIRONMENT"
  expiration_date = "now+3d"
  name            = "example_ag_token"
}

api_token_config = {
  name    = "example_api_token"
  enabled = false
  scopes  = ["geographicRegions.read"]
}

token_settings_config = {
  new_token_format = true
  personal_tokens  = true
}
