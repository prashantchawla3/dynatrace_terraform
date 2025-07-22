
#  Dynatrace Site Reliability Guardian & Workflow Automation Modules

This Terraform module suite provisions a Dynatrace Site Reliability Guardian (SRG) alongside automated remediation workflows. Together they form a resilient, policy-driven monitoring and response pipeline based on service objectives, DQL queries, and predefined runbook actions.

Customer feedback highlighted that previous READMEs lacked clarity and actionable examples — this documentation solves that with elaboration, structured inputs, and concrete examples.

---

##  Module Overview

| Module                     | Purpose                                                                 |
|----------------------------|-------------------------------------------------------------------------|
| `site_reliability_guardian` | Defines objectives with thresholds, tags, and enforcement logic         |
| `automation_workflow`       | Creates workflows with tasks, triggers, and execution actors            |

---

##  Site Reliability Guardian (`site_reliability_guardian`)

###  Purpose

The Site Reliability Guardian defines guardrails across services using SLOs, DQL-based metrics, and thresholds. When an objective is breached, downstream workflows can be triggered for remediation.

###  Inputs

#### `guardian_name`

- **Type**: `string`
- **Description**: The display name for the SRG in Dynatrace.
- **Default**: `"sre-guardian-main"`

 Example:
```hcl
guardian_name = "core-sre-guardian"
```

---

#### `guardian_description`

- **Type**: `string`
- **Description**: Detailed purpose or context of the guardian.
- **Default**: `"Protects services and orchestrates workflow responses..."`

---

#### `guardian_tags`

- **Type**: `list(string)`
- **Description**: Tags that help categorize or filter the guardian in UI or APIs.
- **Default**: `["sre", "automated-monitoring", "slos"]`

---

#### `objectives`

Defines reliability objectives that trigger workflows or alerts when violated.

Each objective includes:

| Field                | Type          | Description |
|----------------------|---------------|-------------|
| `name`               | `string`      | Unique label |
| `description`        | `string`      | Optional explanation |
| `objective_type`     | `string`      | One of: `DQL_QUERY`, `SLO_REFERENCE` |
| `dql_query`          | `string`      | Dynatrace Query Language expression |
| `reference_slo`      | `string`      | Reference SLO ID (if applicable) |
| `comparison_operator`| `string`      | `LOWER`, `GREATER`, `EQUALS` |
| `target`             | `number`      | Numeric target threshold |
| `warning`            | `number`      | Warning threshold below/above target |

 Example:
```hcl
objectives = [
  {
    name                = "Error Rate"
    objective_type      = "DQL_QUERY"
    dql_query           = "fetch logs | filter status == 'error' | count()"
    comparison_operator = "LOWER"
    target              = 0.05
    warning             = 0.02
  }
]
```

---

##  Automation Workflow (`automation_workflow`)

###  Purpose

Creates a workflow with tasks that respond to events (e.g., SRG failure). Workflows consist of tasks (actions) and a trigger.

---

###  Inputs

#### `workflow_title`

- **Type**: `string`
- **Description**: Display name of the workflow.
- **Default**: `"Guardian Workflow"`

---

#### `workflow_description`

- **Type**: `string`
- **Description**: Purpose or context shown in Dynatrace UI.

---

#### `workflow_actor`

- **Type**: `string`
- **Description**: Actor ID (internal Dynatrace or external system).
- **Default**: `"dynatrace"`

---

#### `workflow_owner`

- **Type**: `string`
- **Description**: Team or user responsible for the workflow.
- **Default**: `"team-sre"`

---

#### `workflow_tasks`

List of actions performed when the workflow is triggered.

Each task includes:

| Field       | Type     | Description |
|-------------|----------|-------------|
| `name`      | `string` | Unique label |
| `description` | `string` | Explanation |
| `action`    | `string` | Action ID (e.g., `pagerduty.createIncident`) |
| `active`    | `bool`   | Whether enabled |
| `input`     | `string` | JSON-formatted input string |
| `position.x` / `position.y` | `number` | UI layout position |

 Example:
```hcl
workflow_tasks = [
  {
    name        = "Notify PagerDuty"
    action      = "pagerduty.createIncident"
    input       = "{\"summary\": \"Guardian alert triggered\", \"priority\": \"high\"}"
    position    = { x = 0, y = 0 }
  },
  {
    name        = "Restart Service"
    action      = "runbook.restartContainer"
    input       = "{\"service_id\": \"backend-api\"}"
    position    = { x = 1, y = 0 }
  }
]
```

---

#### `workflow_trigger`

Describes when the workflow executes.

| Field         | Type    | Description |
|---------------|---------|-------------|
| `active`      | `bool`  | Whether enabled |
| `event_type`  | `string`| Trigger type (`GUARDIAN_FAILED`, `MANUAL_TRIGGER`, etc.) |
| `query`       | `string`| DQL query to match triggering conditions |

 Example:
```hcl
workflow_trigger = {
  active     = true
  event_type = "GUARDIAN_FAILED"
  query      = "fetch events | filter type == 'guardian-failure'"
}
```

---

##  Outputs

| Output Name      | Description                                      |
|------------------|--------------------------------------------------|
| `guardian_id`    | The Dynatrace resource ID of the Site Reliability Guardian |
| `workflow_id`    | The Dynatrace resource ID of the automation workflow       |

---


##  Usage Pattern

```hcl
module "site_reliability_guardian" {
  source = "./modules/site_reliability_guardian"
  guardian_name = "team-core-guardian"
  objectives = [ ... ]
}

module "automation_workflow" {
  source = "./modules/automation_workflow"
  workflow_title = "Guardian Recovery Workflow"
  workflow_tasks = [ ... ]
  workflow_trigger = { ... }
}
```

Outputs can be wired into dashboards, alerting profiles, or follow-up Terraform dependencies.

---
