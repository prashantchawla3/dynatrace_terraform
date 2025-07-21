

# Dynatrace Platform Configuration Resources

This README documents Terraform resources used to configure generic settings, Grail metrics access, platform buckets, problem propagation, and security contexts in Dynatrace.


## `dynatrace_grail_metrics_allowall`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`allow_all`**: Set to `true` to allow all metrics in Grail.

### Schema

#### Required
- `allow_all` (Boolean)

---

## `dynatrace_grail_metrics_allowlist`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`allow_rules`**: Define rules to allow specific metrics based on key and pattern.

### Schema

#### Nested: `allow_rules.allow_rule`
- `enabled` (Boolean)
- `metric_key` (String)
- `pattern` (String)

---

## `dynatrace_platform_bucket`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Unique name of the bucket.
- **`display_name`**: Human-readable name.
- **`retention`**: Retention period in days.
- **`table`**: Table name (e.g., `logs`).

### Schema

#### Required
- `name` (String)
- `display_name` (String)
- `retention` (Number)
- `table` (String)

---

## `dynatrace_problem_fields`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enabled`**: Enable or disable the mapping.
- **`event_field`**: Source event field.
- **`problem_field`**: Target problem field.

### Schema

#### Required
- `enabled` (Boolean)
- `event_field` (String)
- `problem_field` (String)

---

## `dynatrace_problem_record_propagation_rules`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enabled`**: Enable or disable the rule.
- **`source_attribute_key`**: Source attribute key.
- **`target_attribute_key`**: Target attribute key.

### Schema

#### Required
- `enabled` (Boolean)
- `source_attribute_key` (String)
- `target_attribute_key` (String)

---

## `dynatrace_security_context`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enabled`**: Enable or disable the security context.

### Schema

#### Required
- `enabled` (Boolean)

---

## Data Source Usage

These resources do not have dedicated data sources. To retrieve existing configurations, use:

```bash
terraform-provider-dynatrace -export <resource_name>
```

Replace `<resource_name>` with the specific resource you want to export.

---

