

# Terraform Modules Documentation

---

## Resource: `dynatrace_http_monitor`

### Required API Token Scopes
- `ExternalSyntheticIntegration` – Create and read synthetic monitors, locations, and nodes

### How to Determine `tfvars` Values
- `name`: Unique name for the monitor.
- `frequency`: Monitoring interval in minutes (5, 10, 15, 30, 60).
- `locations`: List of location entity IDs.
- `script`: Define HTTP requests, headers, and post-processing logic.
- `anomaly_detection`: Configure thresholds and outage handling.
- `tags`: Define tags with context and key-value pairs.

### Schema

#### Required
- `name` (String)
- `frequency` (Number)

#### Optional
- `enabled` (Boolean)
- `locations` (Set of String)
- `manually_assigned_apps` (Set of String)
- `no_script` (Boolean)
- `script` (Block List, Max: 1)
- `tags` (Block List)
- `anomaly_detection` (Block List)

#### Read-Only
- `id` (String)

#### Nested Schema

##### anomaly_detection
- `loading_time_thresholds` (Block List)
- `outage_handling` (Block List)

##### anomaly_detection.loading_time_thresholds.thresholds.threshold
- `value_ms` (Number) – Required
- `event_index` (Number)
- `request_index` (Number)
- `type` (String)

##### anomaly_detection.outage_handling.global_outage_policy
- `consecutive_runs` (Number) – Required

##### anomaly_detection.outage_handling.local_outage_policy
- `affected_locations` (Number) – Required
- `consecutive_runs` (Number) – Required

##### script.request
- `method` (String) – Required
- `url` (String) – Required
- `authentication` (Block List, Max: 1)
- `body` (String)
- `configuration` (Block List, Max: 1)
- `description` (String)
- `post_processing` (String)
- `pre_processing` (String)
- `request_timeout` (Number)
- `validation` (Block List, Max: 1)

##### script.request.configuration.headers.header
- `name` (String) – Required
- `value` (String) – Required

##### script.request.validation.rule
- `type` (String) – Required
- `value` (String) – Required
- `pass_if_found` (Boolean)

---

## Resource: `dynatrace_http_monitor_cookies`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- `scope`: Use the HTTP_CHECK ID.
- `enabled`: Set to `true` or `false`.
- `cookies`: Define cookie name, domain, and value.

### Schema

#### Required
- `enabled` (Boolean)
- `scope` (String)

#### Optional
- `cookies` (Block List, Max: 1)

#### Read-Only
- `id` (String)

#### Nested Schema

##### cookies.cookie
- `domain` (String) – Required
- `name` (String) – Required
- `value` (String) – Required
- `path` (String)

---

## Resource: `dynatrace_http_monitor_outage`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- `scope`: Use `"environment"` or a specific HTTP_CHECK ID.
- Set thresholds and enable/disable global/local outage alerts.

### Schema

#### Required
- `global_outages` (Boolean)
- `local_outages` (Boolean)

#### Optional
- `global_consecutive_outage_count_threshold` (Number)
- `local_consecutive_outage_count_threshold` (Number)
- `local_location_outage_count_threshold` (Number)
- `scope` (String)

#### Read-Only
- `id` (String)

---

## Resource: `dynatrace_http_monitor_performance`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- `scope`: Use the HTTP_CHECK ID.
- `enabled`: Set to `true` or `false`.
- `thresholds`: Define performance thresholds.

### Schema

#### Required
- `enabled` (Boolean)
- `scope` (String)

#### Optional
- `thresholds` (Block List, Max: 1)

#### Read-Only
- `id` (String)

#### Nested Schema

##### thresholds.threshold
- `event` (String) – Required
- `threshold` (Number) – Required

---

## Resource: `dynatrace_http_monitor_script`

### Required API Token Scopes
- `ExternalSyntheticIntegration`

### How to Determine `tfvars` Values
- `http_id`: Reference the ID of the `dynatrace_http_monitor`.
- `script`: Define HTTP requests and configurations.

### Schema

#### Required
- `http_id` (String)
- `script` (Block List, Min: 1, Max: 1)

#### Read-Only
- `id` (String)

#### Nested Schema

##### script.request
- `method` (String) – Required
- `url` (String) – Required
- `authentication` (Block List, Max: 1)
- `body` (String)
- `configuration` (Block List, Max: 1)
- `description` (String)
- `post_processing` (String)
- `pre_processing` (String)
- `request_timeout` (Number)
- `validation` (Block List, Max: 1)

---

## Data Block Usage

To retrieve existing HTTP monitors or related configurations, use the `terraform-provider-dynatrace -export` command with the appropriate resource name. This will help populate your `tfvars` with accurate values.

---

