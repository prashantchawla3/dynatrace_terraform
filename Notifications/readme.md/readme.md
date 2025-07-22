

#  Dynatrace Alerting & Notification Modules

This Terraform package orchestrates alert delivery for Dynatrace problems across multiple channels — including Ansible Tower, email, Slack, Jira, and Trello. Each module is declarative and composable, enabling flexible alert routing aligned with enterprise workflows.

---

##  Modules Overview

### 1. `dynatrace_alerting`

####  Purpose
Creates the core Dynatrace alerting profile used by all downstream notification channels.

####  Input Variable

| Name            | Type     | Description                                             | Example               |
|-----------------|----------|---------------------------------------------------------|-----------------------|
| `alerting_name` | `string` | Logical name for the alerting profile.                 | `"core-alerting-rule"` |

####  Example
```hcl
alerting_name = "core-alerting-rule"
```

####  Output
```hcl
output "alerting_profile_id" {
  value = dynatrace_alerting.Default.id
}
```

---

### 2. `dynatrace_ansible_tower_notification`

####  Purpose
Triggers Ansible Tower job templates in response to Dynatrace problems.

####  Variables

| Name                            | Type        | Description                                        | Example                  |
|---------------------------------|-------------|----------------------------------------------------|--------------------------|
| `ansible_tower_active`          | `bool`      | Enables Ansible Tower notification                 | `true`                   |
| `ansible_tower_name`            | `string`    | Display name for the integration                   | `"AnsibleTower"`         |
| `ansible_tower_insecure`        | `bool`      | Allow unverified TLS connections                  | `false`                  |
| `ansible_tower_job_template_url`| `string`    | Full URL to job template                          | `"https://tower/job/123"`|
| `ansible_tower_username`        | `string`    | Username used for authentication                  | `"admin"`                |
| `ansible_tower_password`        | `string`    | Password (use securely in production)             | (sensitive)              |
| `ansible_tower_custom_message`  | `string`    | Message included in the payload                   | `"Triggered by alert"`   |

---

### 3. `email`

####  Purpose
Sends alert emails with flexible recipient targeting and message customization.

####  Variables

| Name                           | Type             | Description                                           | Example               |
|--------------------------------|------------------|-------------------------------------------------------|-----------------------|
| `email_active`                 | `bool`           | Enables email alerting                                | `true`                |
| `email_name`                   | `string`         | Display name for the email integration                | `"EmailAlerts"`       |
| `email_subject`                | `string`         | Email subject line                                    | `"Alert Notification"`|
| `email_to`, `email_cc`, `email_bcc` | `list(string)` | Recipients by role                                    | `["ops@example.com"]` |
| `email_notify_closed_problems`| `bool`           | Sends email when problem is resolved                  | `true`                |
| `email_body`                   | `string`         | Message body text                                     | `"See Dynatrace..."`  |

---

### 4. `dynatrace_jira_notification`

####  Purpose
Creates Jira issues automatically when Dynatrace alerts are triggered.

####  Variables

| Name              | Type     | Description                                             | Example                      |
|-------------------|----------|---------------------------------------------------------|------------------------------|
| `jira_active`     | `bool`   | Enables Jira alerting                                   | `true`                       |
| `jira_name`       | `string` | Integration name                                        | `"JiraAlerts"`               |
| `jira_url`        | `string` | Jira instance URL                                       | `"https://jira.example.com"` |
| `jira_username`   | `string` | API user                                                | `"jira_bot"`                 |
| `jira_api_token`  | `string` | Secure API token                                        | (sensitive)                  |
| `jira_project_key`| `string` | Target project                                          | `"SRE"`                      |
| `jira_issue_type` | `string` | Type of issue to create                                 | `"Bug"`                      |
| `jira_summary`    | `string` | Jira summary field                                      | `"New Dynatrace alert"`      |
| `jira_description`| `string` | Jira description field                                  | `"Problem details..."`       |

---

### 5. `dynatrace_slack_notification`

####  Purpose
Sends alerts to Slack channels using webhook URLs.

####  Variables

| Name               | Type     | Description                           | Example             |
|--------------------|----------|---------------------------------------|---------------------|
| `slack_active`     | `bool`   | Enables Slack alerting                | `true`              |
| `slack_name`       | `string` | Display name                          | `"SlackChannelAlerts"` |
| `slack_url`        | `string` | Webhook endpoint                      | `"https://hooks.slack..."` |
| `slack_channel`    | `string` | Channel ID or name                    | `"#sre-alerts"`     |
| `slack_message`    | `string` | Message content                       | `"Problem occurred"`|

---

### 6. `dynatrace_trello_notification`

####  Purpose
Creates Trello cards in response to Dynatrace alerts. Cards move between open and resolved lists as problem states change.

####  Variables

| Name                      | Type     | Description                                          | Example                   |
|---------------------------|----------|------------------------------------------------------|---------------------------|
| `trello_active`           | `bool`   | Enables Trello alerting                              | `true`                    |
| `trello_name`             | `string` | Integration label                                    | `"TrelloAlerts"`          |
| `trello_application_key` | `string` | Trello app key (secure)                             | (sensitive)               |
| `trello_authorization_token` | `string` | Auth token (secure)                             | (sensitive)               |
| `trello_board_id`         | `string` | Board ID to target                                   | `"board123"`              |
| `trello_list_id`          | `string` | List ID for open alerts                              | `"list_open"`             |
| `trello_resolved_list_id` | `string` | List ID for resolved alerts                          | `"list_done"`             |
| `trello_text`             | `string` | Card title                                           | `"Dynatrace alert"`       |
| `trello_description`      | `string` | Card description                                     | `"Detailed problem info"` |

---

##  Outputs

| Output Name             | Type           | Description                                  |
|------------------------|----------------|----------------------------------------------|
| `alerting_profile_id`  | `string`       | ID of the core Dynatrace alerting profile    |

These IDs may be referenced in other Terraform modules, API calls, or integrations downstream.

---

##  Usage Pattern

Each module follows a simple pattern:

```hcl
module "slack" {
  source        = "./modules/dynatrace_slack_notification"
  slack_active  = true
  slack_name    = "SlackOpsAlerts"
  slack_url     = "https://hooks.slack.com/..."
  slack_channel = "#ops"
  slack_message = "Problem detected by Dynatrace"
}
```

All modules support toggle flags (e.g. `*_active`) for conditional deployment.

---
