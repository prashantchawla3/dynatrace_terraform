

## `dynatrace_custom_units`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Unique identifier for the unit.
- **`description`**: A brief explanation of the unit.
- **`plural_name`**: Plural form of the unit name.
- **`symbol`**: Unique symbol representing the unit.

### Schema

#### Required
- `name` (String)
- `description` (String)
- `plural_name` (String)
- `symbol` (String)

#### Read-Only
- `id` (String)

---

## `dynatrace_histogram_metrics`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enable_histogram_bucket_ingest`**: Set to `true` to ingest histogram bucket data (e.g., from OpenTelemetry or Prometheus).

### Schema

#### Required
- `enable_histogram_bucket_ingest` (Boolean)

#### Read-Only
- `id` (String)

---

## `dynatrace_metric_metadata`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`metric_id`**: The metric identifier (e.g., `metric-func:slo.terraform-test`).
- **`unit`**: Unit of measurement (e.g., `percent`).
- **`display_name`**: Human-readable name for the metric.
- **`description`**, **`tags`**, and **`unit_display_format`** are optional.
- Use nested blocks to define dimension metadata and metric properties.

### Schema

#### Required
- `metric_id` (String)
- `unit` (String)

#### Optional
- `description` (String)
- `dimensions` (Block List, Max: 1)
- `display_name` (String)
- `metric_properties` (Block List, Max: 1)
- `source_entity_type` (String)
- `tags` (Set of String)
- `unit_display_format` (String)

#### Read-Only
- `id` (String)

#### Nested: `dimensions.dimension`
- `key` (String) — Required
- `display_name` (String) — Optional

#### Nested: `metric_properties`
- `value_type` (String) — Required (Values: `Error`, `Score`, `Unknown`)
- `impact_relevant` (Boolean) — Optional
- `latency` (Number) — Optional (1–60 minutes)
- `max_value` (Number) — Optional
- `min_value` (Number) — Optional
- `root_cause_relevant` (Boolean) — Optional

---

## `dynatrace_metric_query`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`metric_id`**: The metric identifier.
- **`metric_selector`**: The metric query expression.

### Schema

#### Required
- `metric_id` (String)
- `metric_selector` (String)

#### Read-Only
- `id` (String)

---

## Data Source Usage

These resources do not have dedicated data sources. Use the `terraform-provider-dynatrace -export` command to retrieve existing configurations for:

- `dynatrace_custom_units`
- `dynatrace_histogram_metrics`
- `dynatrace_metric_metadata`
- `dynatrace_metric_query`

---
