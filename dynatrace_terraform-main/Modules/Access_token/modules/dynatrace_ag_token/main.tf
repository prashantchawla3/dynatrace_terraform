
resource "dynatrace_ag_token" "example" {
  type            = var.ag_token_config.type
  expiration_date = var.ag_token_config.expiration_date
  name            = var.ag_token_config.name
}
