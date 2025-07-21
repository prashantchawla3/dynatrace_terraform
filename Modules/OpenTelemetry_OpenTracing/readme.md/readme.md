

## `dynatrace_attribute_allow_list`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enabled`**: Set to `true` to allow the attribute.
- **`key`**: Specify the attribute key to persist.

### Schema

#### Required
- `enabled` (Boolean)
- `key` (String)

#### Read-Only
- `id` (String)

---

## `dynatrace_attribute_block_list`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enabled`**: Set to `true` to block the attribute.
- **`key`**: Specify the attribute key to block.

### Schema

#### Required
- `enabled` (Boolean)
- `key` (String)

#### Read-Only
- `id` (String)

---

## `dynatrace_attribute_masking`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enabled`**: Set to `true` to enable masking.
- **`key`**: Attribute key to mask.
- **`masking`**: Choose from `MASK_ENTIRE_VALUE`, `MASK_ONLY_CONFIDENTIAL_DATA`.

### Schema

#### Required
- `enabled` (Boolean)
- `key` (String)
- `masking` (String)

#### Read-Only
- `id` (String)

---

## `dynatrace_attributes_preferences`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`persistence_mode`**: Choose from `ALLOW_ALL_ATTRIBUTES`, `BLOCK_ALL_ATTRIBUTES`.

### Schema

#### Required
- `persistence_mode` (String)

#### Read-Only
- `id` (String)

---

## `dynatrace_opentelemetry_metrics`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`additional_attributes_to_dimension_enabled`**: Set to `true` to add attributes as dimensions.
- **`meter_name_to_dimension_enabled`**: Set to `true` to include meter name and version as dimensions.
- **`scope`**: Use `"environment"` or omit for global scope.
- **`mode`**: Optional. Use `EXPLICIT` or `ADDITIVE`.
- **`additional_attributes`**: List of attributes to include.
- **`to_drop_attributes`**: List of attributes to exclude.

### Schema

#### Optional
- `additional_attributes_to_dimension_enabled` (Boolean)
- `meter_name_to_dimension_enabled` (Boolean)
- `scope` (String)
- `mode` (String)
- `additional_attributes` (Block List, Max: 1)
- `to_drop_attributes` (Block List, Max: 1)

#### Read-Only
- `id` (String)

#### Nested: `additional_attributes.additional_attribute`
- `attribute_key` (String)
- `enabled` (Boolean)

#### Nested: `to_drop_attributes.to_drop_attribute`
- `attribute_key` (String)
- `enabled` (Boolean)

---

## `dynatrace_span_capture_rule`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Name of the rule.
- **`action`**: Action to apply (e.g., `IGNORE`).
- **`matches`**: Define matching criteria.

### Schema

#### Required
- `name` (String)
- `action` (String)
- `matches` (Block List, Min: 1, Max: 1)

#### Optional
- `insert_after` (String)

#### Read-Only
- `id` (String)

#### Nested: `matches.match`
- `comparison` (String)
- `source` (String)
- `value` (String) — Optional
- `key` (String) — Optional
- `case_sensitive` (Boolean) — Optional

---

## `dynatrace_span_context_propagation`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Name of the rule.
- **`action`**: Action to apply (e.g., `PROPAGATE`).
- **`matches`**: Define matching criteria.

### Schema

#### Required
- `name` (String)
- `action` (String)
- `matches` (Block List, Min: 1, Max: 1)

#### Optional
- `insert_after` (String)

#### Read-Only
- `id` (String)

#### Nested: `matches.match`
- `comparison` (String)
- `source` (String)
- `value` (String) — Optional
- `key` (String) — Optional
- `case_sensitive` (Boolean) — Optional

---

## `dynatrace_span_entry_point`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Name of the rule.
- **`action`**: Action to apply (e.g., `DONT_CREATE_ENTRYPOINT`).
- **`matches`**: Define matching criteria.

### Schema

#### Required
- `name` (String)
- `action` (String)
- `matches` (Block List, Min: 1, Max: 1)

#### Optional
- `insert_after` (String)

#### Read-Only
- `id` (String)

#### Nested: `matches.match`
- `comparison` (String)
- `source` (String)
- `value` (String) — Optional
- `key` (String) — Optional
- `case_sensitive` (Boolean) — Optional

---

## Data Source Usage

These resources do not have dedicated data sources. Use the `terraform-provider-dynatrace -export` command to retrieve existing configurations for:

- Attribute allow/block/masking
- OpenTelemetry metrics
- Span capture/context/entry point rules
- Attribute preferences

---

