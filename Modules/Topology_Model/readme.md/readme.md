

## `dynatrace_generic_relationships`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enabled`**: Set to `true` to activate the relationship rule.
- **`created_by`**: Identifier for the user or extension that created the rule.
- **`from_type` / `to_type`**: Define the source and destination entity types.
- **`type_of_relation`**: Choose from `CALLS`, `CHILD_OF`, `INSTANCE_OF`, `PART_OF`, `RUNS_ON`, `SAME_AS`.
- **`from_role` / `to_role`**: Optional roles to distinguish directionality.
- **`sources`**: Define the source type and optional condition and mapping rules.

### Schema

#### Required
- `enabled` (Boolean)
- `created_by` (String)
- `from_type` (String)
- `to_type` (String)
- `type_of_relation` (String)
- `sources` (Block List, Min: 1, Max: 1)

#### Optional
- `from_role` (String)
- `to_role` (String)

#### Read-Only
- `id` (String)

#### Nested: `sources.source`
- `source_type` (String) — Required
- `condition` (String) — Optional
- `mapping_rules` (Block List, Max: 1) — Optional

#### Nested: `mapping_rules.mapping_rule`
- `source_property` (String)
- `source_transformation` (String)
- `destination_property` (String)
- `destination_transformation` (String)

---

## `dynatrace_generic_types`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Unique identifier for the custom entity type.
- **`display_name`**: Human-readable name.
- **`created_by`**: Identifier for the creator.
- **`enabled`**: Set to `true` to activate.
- **`rules`**: Define how entities are extracted from data sources.

### Schema

#### Required
- `name` (String)
- `display_name` (String)
- `created_by` (String)
- `enabled` (Boolean)
- `rules` (Block List, Min: 1, Max: 1)

#### Optional
- `insert_after` (String)

#### Read-Only
- `id` (String)

#### Nested: `rules.rule`
- `id_pattern` (String) — Required
- `sources` (Block List, Min: 1, Max: 1) — Required
- `icon_pattern` (String) — Optional
- `instance_name_pattern` (String) — Optional
- `attributes` (Block List, Max: 1) — Optional
- `required_dimensions` (Block List, Max: 1) — Optional
- `role` (String) — Optional

#### Nested: `sources.source`
- `source_type` (String) — Required
- `condition` (String) — Optional

#### Nested: `attributes.attribute`
- `key` (String)
- `pattern` (String)
- `display_name` (String) — Optional

#### Nested: `required_dimensions.required_dimension`
- `key` (String)
- `value_pattern` (String) — Optional

---

## `dynatrace_grail_security_context`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`entity_type`**: Specify the type of entity whose security context is being overridden.
- **`destination_property`**: The property name to be used for the override.

### Schema

#### Required
- `entity_type` (String)
- `destination_property` (String)

#### Optional
- `insert_after` (String)

#### Read-Only
- `id` (String)

---

## Data Source Usage

These resources do not have dedicated data sources. Use the following command to retrieve existing configurations:

```bash
terraform-provider-dynatrace -export dynatrace_generic_relationships
terraform-provider-dynatrace -export dynatrace_generic_types
terraform-provider-dynatrace -export dynatrace_grail_security_context
```

---

