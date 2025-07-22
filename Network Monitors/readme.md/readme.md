

#  Dynatrace Synthetic Network Monitor Modules

This Terraform module suite provisions robust synthetic network monitors in Dynatrace and configures outage detection thresholds across locations.

It includes:

- `dynatrace_network_monitor`: Defines the synthetic test configuration including steps, locations, performance thresholds, and tagging.
- `dynatrace_network_monitor_outage`: Sets global and per-location outage detection parameters for the monitor.

Each monitor validates availability and performance across critical endpoints and geographies using consistent logic.

---

##  Module: `dynatrace_network_monitor`

###  Purpose

Deploy synthetic network tests in Dynatrace to monitor endpoint reachability, response timing, and health across defined geographies. This module allows declarative control over monitor type, execution schedule, step-by-step testing logic, and tagging.

###  Inputs

| **Variable**                                       | **Type**        | **Description**                                                                            | **Default** |
|----------------------------------------------------|------------------|--------------------------------------------------------------------------------------------|-------------|
| `network_monitor_name`                             | `string`         | Display name for the network monitor                                                      | `"GlobalConnectivityTest"` |
| `network_monitor_description`                      | `string`         | Summary describing what the monitor checks                                                | `"Checks internet access across key regions every 5 minutes"` |
| `network_monitor_type`                             | `string`         | Type of monitor: `PING`, `HTTP`, etc.                                                     | `"PING"` |
| `network_monitor_enabled`                          | `bool`           | Activates or disables the monitor                                                         | `true` |
| `network_monitor_frequency_min`                    | `number`         | Frequency of monitor execution in minutes                                                 | `5` |
| `network_monitor_locations`                        | `list(string)`   | List of Dynatrace geo-location codes to run test from                                     | `["GEO-US", "GEO-EU", "GEO-JP"]` |

#### Performance Thresholds

| Variable | Type | Description | Default |
|---------|------|-------------|---------|
| `network_monitor_performance_thresholds_enabled` | `bool` | Enables alerting based on step-level performance | `true` |
| `network_monitor_threshold_aggregation` | `string` | How values are aggregated: `AVG`, `MAX`, `MIN` | `"AVG"` |
| `network_monitor_threshold_dealerting_samples` | `number` | Number of samples needed below threshold to clear alert | `2` |
| `network_monitor_threshold_samples` | `number` | Number of samples used in evaluation | `5` |
| `network_monitor_threshold_step_index` | `number` | Index of the synthetic step to monitor (starts at 0) | `0` |
| `network_monitor_threshold_value` | `number` | Threshold value (e.g. max response time in ms) | `1000` |
| `network_monitor_threshold_violating_samples` | `number` | Number of samples needed to trigger alert | `3` |

#### Monitor Steps (single-step per monitor)

| Variable | Type | Description | Default |
|---------|------|-------------|---------|
| `network_monitor_step_name` | `string` | Name of the step shown in Dynatrace UI | `"Ping Step"` |
| `network_monitor_step_request_type` | `string` | Type of request to execute (`PING`, `GET`) | `"PING"` |
| `network_monitor_step_target_list` | `list(string)` | List of URLs/endpoints tested in this step | `["https://example.com", "https://internal.service.local"]` |
| `network_monitor_step_properties` | `map(string)` | Custom properties passed to the synthetic test | `{ retries = "3", timeout = "1000" }` |

#### Step Validation

| Variable | Type | Description | Default |
|---------|------|-------------|---------|
| `network_monitor_step_constraint_type` | `string` | Validation rule applied to step result (e.g. `STATUS_CODE`) | `"STATUS_CODE"` |
| `network_monitor_step_constraint_properties` | `map(string)` | Validation parameters | `{ expected_code = "200" }` |
| `network_monitor_step_request_constraint_type` | `string` | Constraint on request contents (e.g. `CONTAINS`) | `"CONTAINS"` |
| `network_monitor_step_request_constraint_properties` | `map(string)` | Request constraint logic | `{ response_text = "pong" }` |

#### Tags

| Variable | Type | Description | Default |
|---------|------|-------------|---------|
| `network_monitor_tag_context` | `string` | Tag grouping context (`SERVICE`, `ENVIRONMENT`) | `"SERVICE"` |
| `network_monitor_tag_key` | `string` | Key used in tag lookup | `"env"` |
| `network_monitor_tag_source` | `string` | Source of tagging (`USER`, `RULE`) | `"USER"` |
| `network_monitor_tag_value` | `string` | Value of the tag applied | `"production"` |

###  Example Configuration

```hcl
network_monitor_name = "GlobalConnectivityTest"
network_monitor_type = "PING"
network_monitor_step_target_list = ["https://example.com"]
network_monitor_threshold_value = 1000
network_monitor_tag_value = "staging"
```

###  Outputs

| Output Variable         | Description                                   |
|--------------------------|-----------------------------------------------|
| `network_monitor_id`     | Unique ID of the monitor in Dynatrace         |

---

##  Module: `dynatrace_network_monitor_outage`

###  Purpose

Defines global and local outage thresholds for the synthetic monitor. Global outages are triggered when all locations fail simultaneously; local outages flag individual regions with degraded performance.

###  Inputs

| Variable | Type | Description | Default |
|---------|------|-------------|---------|
| `network_monitor_outage_global_outages` | `bool` | Enable global outage detection | `true` |
| `network_monitor_outage_global_consecutive_outage_count_threshold` | `number` | Runs required before declaring global outage | `3` |
| `network_monitor_outage_local_outages` | `bool` | Enable local outage detection | `true` |
| `network_monitor_outage_local_consecutive_outage_count_threshold` | `number` | Per-location failures required for local outage | `2` |
| `network_monitor_outage_local_location_outage_count_threshold` | `number` | Number of failing locations to trigger local alert | `1` |
| `network_monitor_outage_scope` | `string` | Tag or group scope used to associate outage logic | `"monitor-group:network"` |

###  Example Configuration

```hcl
network_monitor_outage_global_outages = true
network_monitor_outage_local_consecutive_outage_count_threshold = 2
network_monitor_outage_scope = "monitor-group:network"
```

###  Outputs

| Output Variable               | Description                                     |
|-------------------------------|-------------------------------------------------|
| `network_monitor_outage_id`   | Dynatrace ID for the outage configuration       |

---


