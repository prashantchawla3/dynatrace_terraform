
#  Dynatrace Management Zone v2 Terraform Module

This module provisions a **Dynatrace Management Zone v2**, allowing infrastructure and application monitoring teams to logically segment and filter monitored entities (hosts, services, process groups, applications, etc.) using powerful selector rules.

Management zones are critical for:
-  Scoping dashboards and alerts to teams or environments
-  Enforcing data access boundaries
-  Targeting synthetic monitoring and SLOs by logical partitions

---

##  What This Module Does

Each module invocation represents a specific property for the zone, and collectively wires them into a single `dynatrace_management_zone_v2` resource under the hood.

| Submodule Name         | Purpose                                                           |
|------------------------|-------------------------------------------------------------------|
| `zone_name`            | Sets the zone’s name identifier in Dynatrace                     |
| `zone_description`     | Adds human-readable context about the zone’s purpose              |
| `zone_legacy_id`       | References legacy IDs for migration or traceability               |
| `entity_selector`      | Defines the filtering expression that selects entities into zone  |

> All modules source from `./modules/dynatrace_management_zone_v2`, ensuring consistent resource handling.

---

##  Input Variables Explained

### `zone_name`

- **Purpose**: Assigns a name to the management zone, shown in Dynatrace UI and used for referencing.
- **Type**: `string`
- **Default**: `"default-zone"`



---

### `zone_description`

- **Purpose**: Provides additional textual context for the zone (what it scopes, who owns it, etc.).
- **Type**: `string`
- **Default**: `"Zone for grouped observability across environment scope"`

---

### `zone_legacy_id`

- **Purpose**: Used for backwards compatibility when migrating or referencing pre-existing zones.
- **Type**: `string`
- **Default**: `"legacy-zone-001"`


---

### `entity_selector`

- **Purpose**: Filter logic written in Dynatrace entity selector syntax used to include entities in the zone.
- **Type**: `string`
- **Default**: `"type(HOST),tag(\"env:prod\")"`


---

##  Outputs

These can be consumed by other modules, alerts, or dashboards.

| Output Variable        | Description                                            |
|------------------------|--------------------------------------------------------|
| `management_zone_id`   | Internal Dynatrace ID for this zone                    |
| `management_zone_name` | Zone name as registered in Dynatrace                   |

---

##  Usage Pattern

```hcl
module "zone_name" {
  source    = "./modules/dynatrace_management_zone_v2"
  zone_name = "team-alpha-zone"
}

module "entity_selector" {
  source          = "./modules/dynatrace_management_zone_v2"
  entity_selector = "type(HOST),tag(\"owner:team-alpha\")"
}
```


---

##  Module Use Cases

Ideal for:
- Breaking out observability by team or service owner
- Scoping SLOs to services via zone filtering
- Assigning synthetic tests or alert rules to scoped zones
- Controlling dashboard visibility across environments

---
