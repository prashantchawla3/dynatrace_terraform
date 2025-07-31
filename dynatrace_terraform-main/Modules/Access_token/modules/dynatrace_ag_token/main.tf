resource "dynatrace_ag_token" "example" {
  type            = var.type
  expiration_date = var.expiration_date
  ag_name            = var.ag_name
}
