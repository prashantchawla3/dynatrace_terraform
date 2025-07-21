

# Dynatrace Tagging Resources

This README documents the Terraform resources used to configure automatic and custom tagging in Dynatrace.

---

## `dynatrace_autotag_v2`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Name of the auto tag.
- **`rules_maintained_externally`**: Set to `true` if rules are managed outside this resource.
- **`rules`**: Define tagging rules including type, format, normalization, and attribute conditions.

### Schema

#### Required
- `name` (String)
- `rules_maintained_externally` (Boolean)

#### Nested: `rules.rule`
- `type` (String)
- `enabled` (Boolean)
- `value_format` (String)
- `value_normalization` (String)

#### Nested: `attribute_rule`
- `entity_type` (String)
- `service_to_host_propagation` (Boolean)
- `service_to_pgpropagation` (Boolean)

#### Nested: `attribute_rule.conditions.condition`
- `key` (String)
- `operator` (String)
- `dynamic_key` (String)
- `dynamic_key_source` (String)
- `tag` (String, Optional)

---

## `dynatrace_autotag_rules`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`auto_tag_id`**: Reference to the ID of the `dynatrace_autotag_v2` resource.
- **`rules`**: Define selector-based rules for tagging.

### Schema

#### Required
- `auto_tag_id` (String)

#### Nested: `rules.rule`
- `type` (String)
- `enabled` (Boolean)
- `entity_selector` (String)
- `value_format` (String)
- `value_normalization` (String)

---

## `dynatrace_custom_tags`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`entity_selector`**: Selector to identify the target entities.
- **`tags`**: List of tags to apply, including context, key, and optional value.

### Schema

#### Required
- `entity_selector` (String)

#### Nested: `tags.filter`
- `context` (String)
- `key` (String)
- `value` (String, Optional)

---

## Data Source Usage

These resources do not have dedicated data sources. To retrieve existing configurations, use:

```bash
terraform-provider-dynatrace -export <resource_name>
```

Replace `<resource_name>` with the specific resource you want to export.

---
