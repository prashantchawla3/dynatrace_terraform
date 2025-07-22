module "ownership_team" {
  source = "./modules/ownership_teams"

  team_name                         = var.team_name
  team_description                  = var.team_description
  team_identifier                   = var.team_identifier
  team_external_id                  = var.team_external_id

  responsibility_development        = var.responsibility_development
  responsibility_infrastructure     = var.responsibility_infrastructure
  responsibility_line_of_business   = var.responsibility_line_of_business
  responsibility_operations         = var.responsibility_operations
  responsibility_security           = var.responsibility_security

  additional_info_key               = var.additional_info_key
  additional_info_value             = var.additional_info_value
  additional_info_url               = var.additional_info_url

  contact_integration_type          = var.contact_integration_type
  contact_ms_teams                  = var.contact_ms_teams
  contact_slack_channel             = var.contact_slack_channel
  contact_url                       = var.contact_url
  contact_jira_default_assignee     = var.contact_jira_default_assignee
  contact_jira_project              = var.contact_jira_project

  link_type                         = var.link_type
  link_url                          = var.link_url

  supplementary_identifier          = var.supplementary_identifier
}
