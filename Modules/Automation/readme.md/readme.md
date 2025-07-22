
#  Dynatrace Automation Calendar & Connection Modules

This Terraform module suite provisions business calendars, scheduling rules, and external system integrations used in Dynatrace workflows and automations. It enables teams to define observability-aware schedules and connect third-party systems (e.g. AWS, Jira, Slack, Kubernetes) for integrated orchestration.


---

##  Module Overview

| Module                     | Resource                                 | Purpose                                                        |
|----------------------------|------------------------------------------|----------------------------------------------------------------|
| `calendar`                 | `dynatrace_automation_business_calendar` | Defines working days, holidays, and recurrence logic for workflows |
| `scheduler`                | `dynatrace_automation_scheduling_rule`   | Creates rule-based recurrence logic for triggering automation |
| `aws_connection`           | `dynatrace_automation_workflow_aws_connections` | Connects AWS IAM role to Dynatrace Automation               |
| `jira_connection`          | `dynatrace_automation_workflow_jira`     | Creates a connection to Jira for ticket automation            |
| `k8s_connection`           | `dynatrace_automation_workflow_k8s_connections` | Connects to Kubernetes clusters via token and namespace       |
| `slack_connection`         | `dynatrace_automation_workflow_slack`    | Configures Slack webhook or API token for notifications        |

---

##  Module: `calendar`

###  Purpose

Creates a business calendar used to scope automated workflows (e.g. only trigger on business days, skip holidays).

###  Variables

| Name | Type | Description | Example |
|------|------|-------------|---------|
| `calendar_name` | `string` | Display name in Dynatrace UI | `"Standard Calendar"` |
| `valid_from` | `string` | ISO start date (`YYYY-MM-DD`) | `"2025-01-01"` |
| `valid_to` | `string` | ISO end date | `"2025-12-31"` |
| `week_days` | `list(number)` | Weekdays (1=Monday to 7=Sunday) to include | `[1,2,3,4,5]` |
| `week_start` | `number` | Starting weekday (typically `1` for Monday) | `1` |
| `holidays` | `list(object)` | List of holidays with date and title | See example below |

 Example:
```hcl
holidays = [
  { date = "2025-12-25", title = "Christmas Day" },
  { date = "2025-01-01", title = "New Year's Day" }
]
```

---

##  Module: `scheduler`

###  Purpose

Defines recurrence rules to trigger workflows on a regular schedule.

###  Variables

| Name | Type | Description | Example |
|------|------|-------------|---------|
| `rule_title` | `string` | Title of the scheduling rule | `"Monthly Rule"` |
| `recurrence` | `object` | Recurrence definition including start date, intervals, and constraints | See below |

 Example:
```hcl
recurrence = {
  datestart     = "2025-01-01"
  days_in_month = [1, 15]
  frequency     = "monthly"
  interval      = 1
  weekdays      = ["Monday"]
  workdays      = "true"
}
```

---

##  Module: `aws_connection`

###  Purpose

Connects Dynatrace to AWS using an IAM role for workflow-based access or automation.

###  Variables

| Name | Type | Description | Example |
|------|------|-------------|---------|
| `name` | `string` | Friendly connection name | `"aws-default"` |
| `type` | `string` | Connection type (`iam`) | `"iam"` |
| `role_arn` | `string` | AWS role ARN to assume | `"arn:aws:iam::123456789012:role/example-role"` |

---

##  Module: `jira_connection`

###  Purpose

Establishes integration with Jira to automatically raise or close tickets based on Dynatrace findings.

### Variables

| Name | Type | Description | Example |
|------|------|-------------|---------|
| `name` | `string` | Connection name | `"jira-default"` |
| `type` | `string` | Auth type (`basic`, `oauth`) | `"basic"` |
| `user` | `string` | Jira username | `"admin"` |
| `url` | `string` | Jira base URL | `"https://jira.example.com"` |

>  `password` is excluded from this README for security.

---

##  Module: `k8s_connection`

###  Purpose

Links Dynatrace workflows to Kubernetes clusters for service deployment or remediation automation.

###  Variables

| Name | Type | Description | Example |
|------|------|-------------|---------|
| `name` | `string` | Connection label | `"k8s-default"` |
| `uid` | `string` | Unique cluster identifier | `"cluster-uid-123"` |
| `namespace` | `string` | Kubernetes namespace used by automation | `"default"` |

>  `token` is excluded from this README for security.

---

##  Module: `slack_connection`

###  Purpose

Configures Slack connection for sending notifications via workflows or problem triggers.

###  Variables

| Name | Type | Description | Example |
|------|------|-------------|---------|
| `name` | `string` | Connection name | `"slack-default"` |

>  `token` is excluded from this README for security.

---

##  Outputs

| Output Name | Description |
|-------------|-------------|
| `calendar_id` | ID of the created business calendar |
| `rule_id` | ID of the created scheduling rule |

These can be passed to downstream modules or exported for documentation or reuse.

---



##  Usage Summary

```hcl
module "calendar" {
  source        = "./modules/dynatrace_automation_business_calendar"
  calendar_name = "Business Calendar"
  valid_from    = "2025-01-01"
  valid_to      = "2025-12-31"
  week_days     = [1,2,3,4,5]
  holidays      = [ ... ]
}
```

Repeat similarly for all other modules.
