
module "issue_tracking_enabled" {
  source                 = "./modules/dynatrace_issue_tracking"
  issue_tracking_enabled = var.issue_tracking_enabled
}

module "issue_tracking_issuelabel" {
  source                  = "./modules/dynatrace_issue_tracking"
  issue_tracking_issuelabel = var.issue_tracking_issuelabel
}

module "issue_tracking_issuequery" {
  source                   = "./modules/dynatrace_issue_tracking"
  issue_tracking_issuequery = var.issue_tracking_issuequery
}

module "issue_tracking_issuetheme" {
  source                   = "./modules/dynatrace_issue_tracking"
  issue_tracking_issuetheme = var.issue_tracking_issuetheme
}

module "issue_tracking_issuetrackersystem" {
  source                        = "./modules/dynatrace_issue_tracking"
  issue_tracking_issuetrackersystem = var.issue_tracking_issuetrackersystem
}

module "issue_tracking_token" {
  source              = "./modules/dynatrace_issue_tracking"
  issue_tracking_token = var.issue_tracking_token
}

module "issue_tracking_url" {
  source            = "./modules/dynatrace_issue_tracking"
  issue_tracking_url = var.issue_tracking_url
}

module "issue_tracking_username" {
  source               = "./modules/dynatrace_issue_tracking"
  issue_tracking_username = var.issue_tracking_username
}

module "issue_tracking_insert_after" {
  source                    = "./modules/dynatrace_issue_tracking"
  issue_tracking_insert_after = var.issue_tracking_insert_after
}

module "issue_tracking_password" {
  source               = "./modules/dynatrace_issue_tracking"
  issue_tracking_password = var.issue_tracking_password
}
