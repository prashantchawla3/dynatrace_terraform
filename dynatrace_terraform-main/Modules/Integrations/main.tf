
module "issue_tracking" {
  source                            = "./modules/dynatrace_issue_tracking"
  issue_tracking_enabled            = var.issue_tracking_enabled
  issue_tracking_issuelabel         = var.issue_tracking_issuelabel
  issue_tracking_issuequery         = var.issue_tracking_issuequery
  issue_tracking_issuetheme         = var.issue_tracking_issuetheme
  issue_tracking_issuetrackersystem = var.issue_tracking_issuetrackersystem
  issue_tracking_token              = var.issue_tracking_token
  issue_tracking_url                = var.issue_tracking_url
  issue_tracking_username           = var.issue_tracking_username
  issue_tracking_password           = var.issue_tracking_password
  issue_tracking_insert_after       = var.issue_tracking_insert_after
}


module "remote_environment" {
  source                         = "./modules/dynatrace_remote_environments"
  remote_environment_name        = var.remote_environment_name
  remote_environment_network_scope = var.remote_environment_network_scope
  remote_environment_token       = var.remote_environment_token
  remote_environment_uri         = var.remote_environment_uri
}
