resource "dynatrace_ownership_teams" "example_team" {
  name        = var.team_name
  description = var.team_description
  identifier  = var.team_identifier
  external_id = var.team_external_id

  responsibilities {
    development      = var.responsibility_development
    infrastructure   = var.responsibility_infrastructure
    line_of_business = var.responsibility_line_of_business
    operations       = var.responsibility_operations
    security         = var.responsibility_security
  }

  additional_information {
    additional_information {
      key   = var.additional_info_key
      value = var.additional_info_value
      url   = var.additional_info_url
    }
  }

  contact_details {
    contact_detail {
      integration_type = var.contact_integration_type
      ms_teams         = var.contact_ms_teams
      slack_channel    = var.contact_slack_channel
      url              = var.contact_url

      jira {
        default_assignee = var.contact_jira_default_assignee
        project          = var.contact_jira_project
      }
    }
  }

  links {
    link {
      link_type = var.link_type
      url       = var.link_url
    }
  }

  supplementary_identifiers {
    supplementary_identifier {
      supplementary_identifier = var.supplementary_identifier
    }
  }
}