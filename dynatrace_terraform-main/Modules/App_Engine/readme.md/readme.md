
#  Dynatrace Automation & Discovery Configuration Modules

This Terraform module suite provisions automation controller connections, discovery rule sets, app-level feature flags, and network saturation parameters in Dynatrace. It covers advanced configuration used in infrastructure observability, service discovery, and policy-triggered automation.

---

##  Module Overview

| Module Name        | Resource(s) Created                                | Purpose                                                        |
|--------------------|-----------------------------------------------------|----------------------------------------------------------------|
| `connections`      | `dynatrace_automation_controller_connections`       | Defines external integration endpoints for automation          |
| `default_rules`    | `dynatrace_discovery_default_rules`                | Enables default service and host discovery logic               |
| `actions`          | `dynatrace_event_driven_actions`                   | Creates automation actions tied to event triggers              |
| `discovery_settings` | `dynatrace_discovery_feature_flags`              | Configures granular discovery parameters and thresholds        |

---

##  Input Variables & Examples

###  Module: `connections`

Creates one or more Dynatrace automation controller connections.

| Variable | Type | Description |
|----------|------|-------------|
| `resource_count` | `number` | Number of connections to create |
| `resource_names` | `list(string)` | Names for the connections |
| `url` | `string` | Target endpoint for integration |
| `token` | `string` | API token or integration token _(should be passed securely)_ |
| `type` | `string` | Connection type identifier (e.g., `ansible`, `webhook`, `custom`) |

 Example:
```hcl
resource_count = 2
resource_names = ["control-plane", "edge-node"]
url            = "https://automation.company.com"
token          = "secure-token" # use Terraform input or vault in practice
type           = "ansible"
```

>  Connections support count-based provisioning to create multiple indexed resources.

---

###  Module: `default_rules`

Defines discovery rule sets used in service detection and environment mapping.

| Variable | Type | Description |
|----------|------|-------------|
| `description` | `string` | Rule metadata shown in UI |
| `category` | `string` | Functional category (e.g., `host`, `service`, `infra`) |
| `environment_scope` | `bool` | If `true`, rule applies only within current environment |
| `priority` | `string` | Rule priority: `LOW`, `MEDIUM`, `HIGH`, `CRITICAL` |
| `query` | `string` | Selector query (e.g., `"status:active"` or `"type:SERVICE"`) |
| `title` | `string` | Display name for rule |
| `muted` | `bool` | If `true`, rule is active but does not generate discovery events |

 Example:
```hcl
description        = "Detect all active services with production tags"
category           = "service"
environment_scope  = true
priority           = "HIGH"
query              = "tag:Environment=Production AND status:active"
title              = "Production Service Rule"
muted              = false
```

---

###  Module: `actions`

Creates reusable event-driven automation actions.

| Variable | Type | Description |
|----------|------|-------------|
| `action_name` | `string` | Unique name for the automation action |
| `mode` | `string` | Execution mode: `ENABLED`, `DISABLED`, `DRY_RUN` |

 Example:
```hcl
action_name = "restart-nginx"
mode        = "ENABLED"
```

>  These actions can be bound to workflows or alerting triggers later.

---

###  Module: `discovery_settings`

Sets global and scoped discovery behavior, including interface utilization thresholds.

| Variable | Type | Description |
|----------|------|-------------|
| `boolean_value` | `bool` | Toggles main discovery feature flag |
| `show_monitoring_candidates` | `bool` | If `true`, shows discoverable entities not yet monitored |
| `show_standalone_hosts` | `bool` | Displays hosts with no known services |
| `interface_saturation_threshold` | `number` | % threshold above which network saturation is flagged |

 Example:
```hcl
boolean_value                 = true
show_monitoring_candidates   = true
show_standalone_hosts        = false
interface_saturation_threshold = 90
```

---

##  Outputs

| Output Name                | Description |
|----------------------------|-------------|
| `connection_ids`           | IDs for provisioned controller connection resources |
| `feature_flag_ids`         | App-level feature flag identifiers |
| `default_rule_ids`         | IDs for the default discovery rules applied |
| `discovery_flag_ids`       | Resource IDs for discovery parameter toggles |
| `ansible_connection_ids`   | Resource IDs for event-driven Ansible connections |
| `infraops_setting_ids`     | IDs for infrastructure operations-related settings |

---


##  Terraform Usage Summary

```hcl
module "connections" {
  source  = "./modules/dynatrace_automation_controller_connections"
  count   = var.resource_count
  name    = var.resource_names[count.index]
  url     = var.url
  token   = var.token
  type    = var.type
}
```

Repeat similar structure for the remaining modules.

