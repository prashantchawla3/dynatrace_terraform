# Dynatrace Ownership Teams Module

This Terraform module provisions a Dynatrace Ownership Team using the `dynatrace_ownership_teams` resource. It allows for full configuration of responsibilities, metadata, contact information, links, and identifiers, making it suitable for managing team ownership structures in observability platforms.

---

##  Resource: `dynatrace_ownership_teams`

Defines a Dynatrace ownership team, including detailed configuration for responsibilities, metadata, contacts, and integrations.

### Resource Structure:

```hcl
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
```

---

##  Variables

Each variable is configurable through `.tfvars` or directly when calling the module. Below is a detailed description and example for each variable:

| Variable                          | Description                              | Type     | Example                                                          | Default                                                                                                |
| --------------------------------- | ---------------------------------------- | -------- | ---------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `team_name`                       | Team display name in Dynatrace           | `string` | "Infrastructure Engineering"                                     | "Infrastructure Engineering"                                                                           |
| `team_description`                | Short summary of team responsibilities   | `string` | "Handles provisioning and monitoring"                            | "Handles provisioning, cloud services, and performance monitoring"                                     |
| `team_identifier`                 | Internal unique team ID                  | `string` | "infra-team-001"                                                 | "infra-team-001"                                                                                       |
| `team_external_id`                | Used for external integrations           | `string` | "ext-team-01"                                                    | "ext-team-01"                                                                                          |
| `responsibility_development`      | Is the team responsible for development? | `bool`   | `false`                                                          | `false`                                                                                                |
| `responsibility_infrastructure`   | Does team own infrastructure?            | `bool`   | `true`                                                           | `true`                                                                                                 |
| `responsibility_line_of_business` | Maps to a business unit?                 | `bool`   | `false`                                                          | `false`                                                                                                |
| `responsibility_operations`       | Handles ops/SRE tasks?                   | `bool`   | `true`                                                           | `true`                                                                                                 |
| `responsibility_security`         | Owns security concerns?                  | `bool`   | `false`                                                          | `false`                                                                                                |
| `additional_info_key`             | Metadata key for annotations             | `string` | "pagerduty\_schedule"                                            | "pagerduty\_schedule"                                                                                  |
| `additional_info_value`           | Metadata value (URL, ID, etc.)           | `string` | "[https://example.com/schedule](https://example.com/schedule)"   | "[https://pagerduty.com/schedules/team01](https://pagerduty.com/schedules/team01)"                     |
| `additional_info_url`             | Optional docs/reference URL              | `string` | "[https://example.com/team-docs](https://example.com/team-docs)" | "[https://wiki.company.com/infra-team](https://wiki.company.com/infra-team)"                           |
| `contact_integration_type`        | Tool used for notifications              | `string` | "Slack"                                                          | "Slack"                                                                                                |
| `contact_ms_teams`                | MS Teams channel ID                      | `string` | "infra-alerts"                                                   | "infra-alerts"                                                                                         |
| `contact_slack_channel`           | Slack channel name                       | `string` | "#infra-notify"                                                  | "#infra-notify"                                                                                        |
| `contact_url`                     | Link to team docs/support                | `string` | "[https://support.example.com](https://support.example.com)"     | "[https://support.company.com/team/infra](https://support.company.com/team/infra)"                     |
| `contact_jira_default_assignee`   | Default assignee in Jira                 | `string` | "infra-automation"                                               | "infra-automation"                                                                                     |
| `contact_jira_project`            | Jira project key                         | `string` | "INFRA"                                                          | "INFRA"                                                                                                |
| `link_type`                       | Link type (wiki, dashboard, etc.)        | `string` | "runbook"                                                        | "runbook"                                                                                              |
| `link_url`                        | URL for the link                         | `string` | "[https://example.com/runbook](https://example.com/runbook)"     | "[https://wiki.company.com/runbooks/infra-recovery](https://wiki.company.com/runbooks/infra-recovery)" |
| `supplementary_identifier`        | Alias/secondary team ID                  | `string` | "team-infra-recovery-01"                                         | "team-infra-recovery-01"                                                                               |

---

##  Outputs

| Output      | Description                        |
| ----------- | ---------------------------------- |
| `team_id`   | ID of the Dynatrace team created   |
| `team_name` | Name of the Dynatrace team created |

---

##  Usage Example

```hcl
module "ownership_team" {
  source = "./modules/ownership_teams"

  team_name                         = "Infrastructure Engineering"
  team_description                  = "Handles provisioning and monitoring"
  team_identifier                   = "infra-team-001"
  team_external_id                  = "ext-team-01"

  responsibility_development        = false
  responsibility_infrastructure     = true
  responsibility_line_of_business   = false
  responsibility_operations         = true
  responsibility_security           = false

  additional_info_key               = "pagerduty_schedule"
  additional_info_value             = "https://pagerduty.com/schedules/team01"
  additional_info_url               = "https://wiki.company.com/infra-team"

  contact_integration_type          = "Slack"
  contact_ms_teams                  = "infra-alerts"
  contact_slack_channel             = "#infra-notify"
  contact_url                       = "https://support.company.com/team/infra"
  contact_jira_default_assignee     = "infra-automation"
  contact_jira_project              = "INFRA"

  link_type                         = "runbook"
  link_url                          = "https://wiki.company.com/runbooks/infra-recovery"

  supplementary_identifier          = "team-infra-recovery-01"
}
```

---

##  Security & Best Practices

* **No secrets** are stored or passed in this module.
* Use `terraform.tfvars` or a CI/CD secrets manager for injecting real values.
* Validate identifiers for uniqueness across environments.

---

##  References

* [Dynatrace Ownership Teams Documentation](https://www.dynatrace.com/support/help/)
* [Terraform Dynatrace Provider](https://registry.terraform.io/providers/dynatrace-oss/dynatrace/latest/docs/resources/ownership_teams)

---
