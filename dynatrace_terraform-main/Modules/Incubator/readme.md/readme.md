
#  Dynatrace Golden State Governance Modules

This Terraform module set provisions governance policies for automated enforcement in Dynatrace using two modes:

- **Auto-Delete Mode**: Enforces deletion of stale or non-compliant resources based on preconfigured zone and alerting references.
- **Warning Mode**: Generates warnings based on autotag triggers for visibility without enforcement.

Each module supports fine-grained control over scoped configuration artifacts and operational policies within Dynatrace’s Golden State framework.

---

##  Module: `dynatrace_golden_state_auto_delete`

###  Purpose

Enforces deletion of outdated, misaligned, or unnecessary management zones and alerting profiles based on preset identifiers and operational mode.

###  Input Variables

| Variable | Type | Description | Default |
|---------|------|-------------|---------|
| `auto_delete_mode` | `string` | Defines behavior: `strict` (force deletion), `lazy` (mark for review only) | `"strict"` |
| `auto_delete_management_zone_ids` | `list(string)` | List of management zone identifiers targeted for removal | `["mz-ops", "mz-legacy"]` |
| `auto_delete_alerting_ids` | `list(string)` | Alerting configuration IDs flagged for deletion | `["alert-high-memory", "alert-old-sla"]` |




###  Outputs

| Name | Description |
|------|-------------|
| `auto_delete_management_zone_ids` | Returns applied zone IDs for deletion |
| `auto_delete_alerting_ids` | Returns alerting configs flagged for removal |

---

##  Module: `dynatrace_golden_state_warn`

###  Purpose

Scans autotags and configuration identifiers for governance misalignment, triggering soft warnings and visibility alerts without deleting resources.

###  Input Variables

| Variable | Type | Description | Default |
|----------|------|-------------|---------|
| `warn_mode` | `string` | Behavior mode: `notify` (logs/warnings) or `log-only` (no action taken) | `"notify"` |
| `warn_autotag_ids` | `list(string)` | Autotag identifiers used to detect governance drift | `["tag-expired", "tag-risky"]` |



###  Output

| Name | Description |
|------|-------------|
| `warn_autotag_ids` | List of autotags used for warning enforcement |

---

##  Modular Composition

Each module is sourced from a governance-specific subfolder:

```hcl
module "auto_delete_mode" {
  source = "./modules/dynatrace_golden_state_auto_delete"
  auto_delete_mode = "strict"
}
```

You may invoke all fields together or split across modules for composability and layered enforcement.

---

##  Use Cases

- Automated cleanup of legacy or deprecated configurations
- Alerting zone decommission enforcement
- Drift detection for resource tagging policies
- Non-disruptive warning issuance to configuration owners

---
