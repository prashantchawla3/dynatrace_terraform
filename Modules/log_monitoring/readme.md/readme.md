

## Dynatrace Log Management Resources

Each resource below is related to Dynatrace log ingestion, processing, storage, and enrichment.

---

### `dynatrace_log_agent_feature_flags`

#### Required API Token Scopes
- `settings.read`
- `settings.write`

#### How to Determine tfvars Values
- **`scope`**: Specify the host or environment scope.
- **`new_container_log_detector`**: Enable or disable the new container log detection.

#### Schema

- **Required**
  - `scope` (String)
  - `new_container_log_detector` (Boolean)

---

### `dynatrace_log_buckets`

#### Required API Token Scopes
- `settings.read`
- `settings.write`

#### How to Determine tfvars Values
- **`enabled`**: Enable or disable the log bucket.
- **`bucket_name`**: Name of the log bucket.
- **`matcher`**: Query to match logs.
- **`rule_name`**: Name of the rule.

#### Schema

- **Required**
  - `enabled` (Boolean)
  - `bucket_name` (String)
  - `matcher` (String)
  - `rule_name` (String)

---

### `dynatrace_log_custom_attribute`

#### Required API Token Scopes
- `settings.read`
- `settings.write`

#### How to Determine tfvars Values
- **`sidebar`**: Show attribute in sidebar.
- **`key`**: Attribute key.

#### Schema

- **Required**
  - `sidebar` (Boolean)
  - `key` (String)

---

### `dynatrace_log_custom_source`

#### Required API Token Scopes
- `settings.read`
- `settings.write`

#### How to Determine tfvars Values
- **`name`**: Name of the custom source.
- **`enabled`**: Enable or disable the source.
- **`scope`**: Scope of the source.
- **`custom_log_source`**: Define type and enrichment.

#### Schema

- **Required**
  - `name` (String)
  - `enabled` (Boolean)
  - `scope` (String)

- **Nested: `custom_log_source`**
  - `type` (String)
  - `values_and_enrichment` (List)

- **Nested: `custom_log_source_with_enrichment`**
  - `path` (String)
  - `enrichment` (List of key-value pairs)

---

### `dynatrace_log_debug_settings`

#### Required API Token Scopes
- `settings.read`
- `settings.write`

#### How to Determine tfvars Values
- **`enabled`**: Enable or disable debug logging.

#### Schema

- **Required**
  - `enabled` (Boolean)

---

### `dynatrace_log_events`

#### Required API Token Scopes
- `settings.read`
- `settings.write`

#### How to Determine tfvars Values
- **`enabled`**: Enable or disable event generation.
- **`query`**: Log query.
- **`summary`**: Event summary.
- **`event_template`**: Define event metadata.

#### Schema

- **Required**
  - `enabled` (Boolean)
  - `query` (String)
  - `summary` (String)

- **Nested: `event_template`**
  - `description` (String)
  - `event_type` (String)
  - `title` (String)
  - `metadata` (List of key-value pairs)

---

### `dynatrace_log_metrics`

#### Required API Token Scopes
- `settings.read`
- `settings.write`

#### How to Determine tfvars Values
- **`enabled`**: Enable or disable metric extraction.
- **`dimensions`**: List of dimensions.
- **`key`**: Metric key.
- **`measure`**: Type of measure.
- **`measure_attribute`**: Attribute to measure.
- **`query`**: Log query.

#### Schema

- **Required**
  - `enabled` (Boolean)
  - `dimensions` (List of String)
  - `key` (String)
  - `measure` (String)
  - `measure_attribute` (String)
  - `query` (String)

---

### `dynatrace_log_oneagent`

#### Required API Token Scopes
- `settings.read`
- `settings.write`

#### How to Determine tfvars Values
- Configure various OneAgent log detection and parsing settings.

#### Schema

- **Required**
  - `scope` (String)
  - Multiple Boolean and numeric fields for detection and limits

---

### `dynatrace_log_processing`

#### Required API Token Scopes
- `settings.read`
- `settings.write`

#### How to Determine tfvars Values
- **`enabled`**: Enable or disable processing.
- **`query`**: Log query.
- **`rule_name`**: Name of the rule.
- **`processor_definition`**: Define parsing logic.
- **`rule_testing`**: Provide sample log.

#### Schema

- **Required**
  - `enabled` (Boolean)
  - `query` (String)
  - `rule_name` (String)

- **Nested: `processor_definition`**
  - `rule` (String)

- **Nested: `rule_testing`**
  - `sample_log` (String)

---

### `dynatrace_log_security_context`

#### Required API Token Scopes
- `settings.read`
- `settings.write`

#### How to Determine tfvars Values
- Define security context rules for logs.

#### Schema

- **Nested: `security_context_rule`**
  - `query` (String)
  - `rule_name` (String)
  - `value_source_field` (String)
  - `value_source` (String)

---

### `dynatrace_log_sensitive_data_masking`

#### Required API Token Scopes
- `settings.read`
- `settings.write`

#### How to Determine tfvars Values
- **`name`**: Rule name.
- **`enabled`**: Enable or disable masking.
- **`scope`**: Scope of the rule.
- **`masking`**: List of masking rules.
- **`matchers`**: List of matchers.

#### Schema

- **Required**
  - `name` (String)
  - `enabled` (Boolean)
  - `scope` (String)

- **Nested: `masking`**
  - `type` (String)
  - `expression` (String)

- **Nested: `matchers.matcher`**
  - `attribute` (String)
  - `operator` (String)
  - `values` (List of String)

---

### `dynatrace_log_storage`

#### Required API Token Scopes
- `settings.read`
- `settings.write`

#### How to Determine tfvars Values
- **`name`**: Rule name.
- **`enabled`**: Enable or disable storage.
- **`scope`**: Scope of the rule.
- **`send_to_storage`**: Boolean flag.
- **`matchers`**: List of matchers.

#### Schema

- **Required**
  - `name` (String)
  - `enabled` (Boolean)
  - `scope` (String)
  - `send_to_storage` (Boolean)

- **Nested: `matchers.matcher`**
  - `attribute` (String)
  - `operator` (String)
  - `values` (List of String)

---

### `dynatrace_log_timestamp`

#### Required API Token Scopes
- `settings.read`
- `settings.write`

#### How to Determine tfvars Values
- **`enabled`**: Enable or disable timestamp parsing.
- **`config_item_title`**: Title of the config.
- **`date_time_pattern`**: Pattern for parsing.
- **`scope`**: Scope of the rule.
- **`timezone`**: Timezone.
- **`matchers`**: List of matchers.

#### Schema

- **Required**
  - `enabled` (Boolean)
  - `config_item_title` (String)
  - `date_time_pattern` (String)
  - `scope` (String)
  - `timezone` (String)

- **Nested: `matchers.matcher`**
  - `attribute` (String)
  - `operator` (String)
  - `values` (List of String)

---

## Data Source Usage

These resources do not have dedicated data sources. Use the following command to retrieve existing configurations:

```bash
terraform-provider-dynatrace -export <resource_name>
```

Replace `<resource_name>` with the specific resource you want to export.

---

