resource "dynatrace_credentials" "this" {
  name     = var.credentials_name
  scopes   = var.credentials_scopes
  username = var.credentials_username
  password = var.credentials_password
}
