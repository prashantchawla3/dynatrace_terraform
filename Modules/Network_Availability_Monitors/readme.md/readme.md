
## `dynatrace_network_monitor`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Provide a unique name for the monitor.
- **`type`**: Use `"MULTI_PROTOCOL"` for multi-protocol monitoring.
- **`enabled`**: Set to `true` or `false` to enable or disable the monitor.
- **`frequency_min`**: Set the frequency in minutes.
- **`locations`**: Provide a list of synthetic location IDs.
- **`steps`**: Define each step with request type, targets, and constraints.
- **`outage_handling`**: Configure thresholds for global and local outages.
- **`performance_thresholds`**: Define thresholds for performance alerts.
- **`tags`**: Add tags for categorization.

### Schema

#### Required
- `name` (String)
- `type` (String)
- `locations` (Set of String)
- `steps` (Block List, Min: 1)

#### Optional
- `description` (String)
- `enabled` (Boolean)
- `frequency_min` (Number)
- `outage_handling` (Block List, Max: 1)
- `performance_thresholds` (Block List, Max: 1)
- `tags` (Block List)

#### Read-Only
- `id` (String)

#### Nested: `steps.step`
- `name` (String)
- `request_type` (String)
- `target_list` (Set of String)
- `properties` (Map of String)
- `constraints` (Block List, Min: 1)
- `request_configurations` (Optional Block List)
- `target_filter` (Optional String)

#### Nested: `steps.step.constraints.constraint`
- `type` (String)
- `properties` (Map of String)

#### Nested: `steps.step.request_configurations.request_configuration.constraints.constraint`
- `type` (String)
- `properties` (Map of String)

#### Nested: `outage_handling`
- `global_consecutive_outage_count_threshold` (Number)
- `global_outages` (Boolean)
- `local_consecutive_outage_count_threshold` (Number)
- `local_location_outage_count_threshold` (Number)
- `local_outages` (Boolean)

#### Nested: `performance_thresholds`
- `enabled` (Boolean)
- `thresholds` (Block List)

#### Nested: `performance_thresholds.thresholds.threshold`
- `aggregation` (String)
- `dealerting_samples` (Number)
- `samples` (Number)
- `step_index` (Number)
- `threshold` (Number)
- `violating_samples` (Number)

#### Nested: `tags.tag`
- `key` (String)
- `context` (Optional String)
- `source` (Optional String)
- `value` (Optional String)

#### Data Source Usage
Use `data "dynatrace_network_monitor"` to retrieve existing monitor configurations.

---

## `dynatrace_network_monitor_outage`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`global_outages`**: Set to `true` to alert when all locations fail.
- **`local_outages`**: Set to `true` to alert on local failures.
- **`global_consecutive_outage_count_threshold`**: Number of consecutive failures across all locations.
- **`local_consecutive_outage_count_threshold`**: Number of consecutive failures at any location.
- **`local_location_outage_count_threshold`**: Number of failing locations.
- **`scope`**: Use `"MULTIPROTOCOL_MONITOR"` or omit for environment-wide scope.

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

#### Data Source Usage
Use `data "dynatrace_network_monitor_outage"` to retrieve existing outage handling settings.

---
