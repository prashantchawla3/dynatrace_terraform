resource "dynatrace_remote_environments" "this" {
  name           = var.remote_environment_name
  network_scope  = var.remote_environment_network_scope
  token          = var.remote_environment_token
  uri            = var.remote_environment_uri
}