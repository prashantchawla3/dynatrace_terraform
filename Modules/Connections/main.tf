

module "jenkins_connections" {
  source               = "./modules/dynatrace_jenkins_connection"
  jenkins_connections  = var.jenkins_connections
}

module "github_connections" {
  source              = "./modules/dynatrace_github_connection"
  github_connections  = var.github_connections
}

module "gitlab_connections" {
  source             = "./modules/dynatrace_gitlab_connection"
  gitlab_connections = var.gitlab_connections
}

module "ms365_email_connections" {
  source                   = "./modules/dynatrace_ms365_email_connection"
  ms365_email_connections  = var.ms365_email_connections
}

module "msentraid_connections" {
  source                = "./modules/dynatrace_msentraid_connection"
  msentraid_connections = var.msentraid_connections
}

module "msteams_connections" {
  source               = "./modules/dynatrace_msteams_connection"
  msteams_connections  = var.msteams_connections
}

module "pagerduty_connections" {
  source                = "./modules/dynatrace_pagerduty_connection"
  pagerduty_connections = var.pagerduty_connections
}

module "servicenow_connections" {
  source                 = "./modules/dynatrace_servicenow_connection"
  servicenow_connections = var.servicenow_connections
}
