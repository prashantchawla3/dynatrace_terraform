
#  Dynatrace Log Configuration Modules

This Terraform module set configures end-to-end log ingestion, parsing, enrichment, masking, storage routing, and metric extraction within Dynatrace.

These modules address:

-  Log bucket creation
-  Feature flags for agents
-  Log filtering, masking, and enrichment
-  Custom attributes, processing, and timestamp rules
-  Metric extraction and event detection


The documentation below explains each module’s purpose, variables, and outputs in a clear and comparison-friendly format.

---

##  Module: `dynatrace_log_agent_feature_flags`

###  Purpose
Enable container-specific log detection features for targeted scopes.

###  Variable: `log_agent_feature_flags`

| Field                      | Type    | Description                                  |
|---------------------------|---------|----------------------------------------------|
| `scope`                   | string  | Target scope (e.g., host, container ID)      |
| `new_container_log_detector` | bool | Enables newer detection logic                |



---

##  Module: `dynatrace_log_buckets`

###  Purpose
Create logical groupings of logs using matchers and rules.

###  Variable: `log_buckets`

| Field        | Type    | Description                             |
|--------------|---------|-----------------------------------------|
| `enabled`     | bool   | Whether the bucket is active            |
| `bucket_name` | string | Display name of the bucket              |
| `matcher`     | string | Filter criteria used for inclusion      |
| `rule_name`   | string | Reference identifier for the rule       |



---

##  Module: `dynatrace_log_custom_attribute`

###  Purpose
Add custom key-value attributes to the Dynatrace log sidebar.

###  Variable: `log_custom_attribute`

| Field     | Type    | Description                             |
|-----------|---------|-----------------------------------------|
| `sidebar` | bool    | If true, attribute is shown in sidebar  |
| `key`     | string  | Key for the custom attribute            |

---

##  Module: `dynatrace_log_custom_source`

###  Purpose
Register custom log sources with enrichment fields.

###  Variable: `log_custom_source`

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Name of the custom source |
| `enabled` | bool | Toggle |
| `scope` | string | Target resource |
| `custom_log_source.type` | string | Source type (file, json, etc.) |
| `values_and_enrichment[].custom_log_source_with_enrichment.path` | string | Log source path |
| `enrichment[].type`, `key`, `value` | string | Enrichment key/value injection |

---

##  Module: `dynatrace_log_debug_settings`

###  Purpose
Globally toggle Dynatrace debug logging features.

###  Variable: `log_debug_settings`

| Field    | Type  | Description              |
|----------|-------|--------------------------|
| `enabled` | bool | Enable global debug logs |

---

##  Module: `dynatrace_log_events`

###  Purpose
Extract structured events from logs and publish them in Dynatrace as problem cards.

###  Variable: `log_events`

| Field           | Type     | Description |
|-----------------|----------|-------------|
| `enabled`       | bool     | Toggle for the rule |
| `query`         | string   | Log query expression |
| `summary`       | string   | Short summary for the event |
| `event_template.description` | string | Full event description |
| `event_template.title`      | string | Event title |
| `event_template.event_type` | string | Type (e.g., CUSTOM_ALERT) |
| `metadata.items[].metadata_key/metadata_value` | string | Key-value pairs attached to event metadata |

---

##  Module: `dynatrace_log_metrics`

###  Purpose
Extract and aggregate log-based metrics.

###  Variable: `log_metrics`

| Field                | Type     | Description |
|----------------------|----------|-------------|
| `enabled`            | bool     | Toggle |
| `dimensions`         | list     | Dimensions used for metric separation |
| `key`, `measure`, `measure_attribute` | string | Metric config |
| `query`              | string   | Filter query used for metric extraction |

---

##  Module: `dynatrace_log_oneagent`

###  Purpose
Configure detailed OneAgent log behavior and limits.

###  Variable: `log_oneagent`

Includes fields like:
- `containers_logs_detection_enabled`
- `monitor_own_logs_enabled`
- `default_timezone`
- `log_scanner_linux_nfs_enabled`
- `event_log_query_timeout_sec`
- `scope`

These apply at agent level for container log visibility and log indexing thresholds.

---

##  Module: `dynatrace_log_processing`

###  Purpose
Define log processing rules, regex parsing, and inline validation.

###  Variable: `log_processing`

| Field                   | Type     | Description |
|-------------------------|----------|-------------|
| `enabled`               | bool     | Toggle |
| `query`                 | string   | Selector |
| `rule_name`             | string   | Identifier |
| `processor_definition.rule` | string | Regex or rule |
| `rule_testing.sample_log` | string | Sample used for validation |

---

##  Module: `dynatrace_log_security_context`

###  Purpose
Detect security-relevant context from logs (e.g. user ID, role, action).

###  Variable: `log_security_context`

| Field                      | Type    | Description |
|----------------------------|---------|-------------|
| `query`                    | string  | Filter |
| `rule_name`                | string  | Identifier |
| `value_source_field`       | string  | Field used for extracting values |
| `value_source`             | string  | Source method (e.g. header, field) |

---

##  Module: `dynatrace_log_sensitive_data_masking`

###  Purpose
Mask sensitive information such as API keys, tokens, or customer identifiers from log output.

###  Variable: `log_sensitive_data_masking`

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Rule name |
| `enabled` | bool | Toggle |
| `scope` | string | Where it applies |
| `masking[].type` | string | Masking type (REGEX, HASH, etc.) |
| `masking[].expression` | string | Regex or match pattern |
| `matchers[].matcher[].attribute`, `operator`, `values` | string/list | Conditional filters |

---

##  Module: `dynatrace_log_storage`

###  Purpose
Route logs to storage targets based on conditional filters.

###  Variable: `log_storage`

| Field              | Type   | Description |
|--------------------|--------|-------------|
| `name`, `scope`    | string | Target metadata |
| `enabled`, `send_to_storage` | bool | Flags |
| `matchers[].matcher[].attribute/operator/values` | string/list | Filter logic |

---

## Module: `dynatrace_log_timestamp`

###  Purpose
Extract timestamps from log lines using custom date formats.

###  Variable: `log_timestamp`

| Field                      | Type   | Description |
|----------------------------|--------|-------------|
| `enabled`                  | bool   | Toggle |
| `config_item_title`        | string | Name |
| `date_time_pattern`        | string | Date format string (e.g. `yyyy-MM-dd HH:mm:ss.SSS`) |
| `scope`, `timezone`        | string | Where rule applies |
| `matchers[].matcher[].attribute/operator/values` | string/list | Filtering conditions |

---

##  Outputs

These can be used for downstream modules or exported documentation:

| Output Name | Description |
|-------------|-------------|
| `log_agent_feature_flags` | Resources for agent feature toggles |
| `log_buckets` | Bucket config |
| `log_custom_attribute` | Sidebar attributes |
| `log_custom_source` | Source definitions with enrichment |
| `log_debug_settings` | Debug toggles |
| `log_events` | Extracted event resources |
| `log_metrics` | Log-based metric resources |
| `log_oneagent` | Agent-level scan and parsing logic |
| `log_processing` | Parser and pre-processing logic |
| `log_security_context` | Context rules |
| `log_sensitive_data_masking` | Masking definitions |
| `log_storage` | Storage routing logic |
| `log_timestamp` | Timestamp extraction patterns |

---

