

## `dynatrace_management_zone_v2`

### Required API Token Scopes
- `settings.read`
- `settings.write`

---

### How to Determine tfvars Values

- **`zone_name`**: Provide a unique name for the management zone.
- **`zone_description`**: Describe the purpose or scope of the zone.
- **`zone_legacy_id`**: Optional legacy identifier for backward compatibility.
- **`entity_selector`**: Define the Dynatrace entity selector string to filter entities.
- **`rules`**: Define one or more rules to include entities in the zone based on attributes or dimensions.

---

### Schema

#### Required
- `name` (String): Name of the management zone.
- `rules` (Block List): List of rules defining the zone.

#### Optional
- `description` (String): Description of the zone.
- `legacy_id` (String): Legacy identifier.

#### Read-Only
- `id` (String): The ID of the resource.

---

### Nested Schema: `rules.rule`

#### Required
- `type` (String): Rule type, e.g., `ME`, `DIMENSION`.
- `enabled` (Boolean): Whether the rule is active.
- `entity_selector` (String): Entity selector string.

#### Optional
- `attribute_rule` (Block): Defines attribute-based conditions.
- `dimension_rule` (Block): Defines dimension-based conditions.

---

### Nested Schema: `attribute_rule`

#### Required
- `entity_type` (String): Type of entity (e.g., `HOST`, `WEB_APPLICATION`).
- `attribute_conditions` (Block): List of conditions.

#### Optional
- `host_to_pgpropagation` (Boolean): Whether to propagate host attributes to process groups.

---

### Nested Schema: `attribute_conditions.condition`

#### Required
- `key` (String): Attribute key.
- `operator` (String): Comparison operator (e.g., `EQUALS`, `CONTAINS`).

#### Optional
- `case_sensitive` (Boolean): Whether the match is case-sensitive.
- `string_value` (String): String value to match.
- `enum_value` (String): Enum value to match.

---

### Nested Schema: `dimension_rule`

#### Required
- `applies_to` (String): Scope of the dimension rule (e.g., `METRIC`).
- `dimension_conditions` (Block): List of dimension conditions.

---

### Nested Schema: `dimension_conditions.condition`

#### Required
- `condition_type` (String): Type of condition (e.g., `METRIC_KEY`).
- `rule_matcher` (String): Matcher type (e.g., `BEGINS_WITH`).
- `value` (String): Value to match.

---

### Data Source Usage

This resource does not have a dedicated data source. To retrieve existing configurations, use:

```bash
terraform-provider-dynatrace -export dynatrace_management_zone_v2
```

---
