

## `dynatrace_geolocation`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Set `display_worldmap` to `true` to enable the world map.
- Use `scope = "environment"` for global application.

### Schema

#### Required
- `display_worldmap` (Boolean)

#### Optional
- `scope` (String)

#### Read-Only
- `id` (String)

#### Data Source Usage
Use `data "dynatrace_geolocation"` to retrieve existing geolocation settings.

---

## `dynatrace_process_group_rum`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Set `enable` to `true` or `false`.
- Provide a valid `process_group_id` (e.g., `PROCESS_GROUP-XXXXXXXXXXXX`).

### Schema

#### Required
- `enable` (Boolean)
- `process_group_id` (String)

#### Read-Only
- `id` (String)

---

## `dynatrace_rum_advanced_correlation`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Choose a `matcher` from: `CONTAINS`, `ENDS_WITH`, `EQUALS`, `STARTS_WITH`.
- Provide a `pattern` string to match.

### Schema

#### Required
- `matcher` (String)
- `pattern` (String)

#### Read-Only
- `id` (String)

---

## `dynatrace_rum_host_headers`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Set `header_name` to the HTTP header used for host identification.

### Schema

#### Required
- `header_name` (String)

#### Optional
- `insert_after` (String)

#### Read-Only
- `id` (String)

---

## `dynatrace_rum_ip_determination`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Set `header_name` to the HTTP header used for client IP detection.

### Schema

#### Required
- `header_name` (String)

#### Optional
- `insert_after` (String)

#### Read-Only
- `id` (String)

---

## `dynatrace_rum_ip_locations`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Provide `country_code`, `ip`, and optionally `ip_to`, `city`, `latitude`, `longitude`, `region_code`.

### Schema

#### Required
- `country_code` (String)
- `ip` (String)

#### Optional
- `ip_to` (String)
- `city` (String)
- `latitude` (Number)
- `longitude` (Number)
- `region_code` (String)

#### Read-Only
- `id` (String)

---

## `dynatrace_rum_overload_prevention`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Set `overload_prevention_limit` to the desired session capture threshold.

### Schema

#### Required
- `overload_prevention_limit` (Number)

#### Read-Only
- `id` (String)

---

## `dynatrace_rum_provider_breakdown`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Set `resource_name`, `resource_type`, and `domain_name_pattern_list`.
- Optionally set `icon_url`.

### Schema

#### Required
- `resource_name` (String)
- `resource_type` (String)
- `report_public_improvement` (Boolean)
- `domain_name_pattern_list` (Block List)

#### Optional
- `icon_url` (String)
- `insert_after` (String)

#### Read-Only
- `id` (String)

#### Nested: `domain_name_pattern_list.domain_name_pattern`
- `pattern` (String)

---

## `dynatrace_usability_analytics`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Set `detect_rage_clicks` to `true` or `false`.
- Optionally set `application_id`.

### Schema

#### Required
- `detect_rage_clicks` (Boolean)

#### Optional
- `application_id` (String)

#### Read-Only
- `id` (String)

---

## `dynatrace_user_action_metrics`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Set `enabled`, `metric_key`, and `value.type`.
- Optionally define `dimensions` and `filters`.

### Schema

#### Required
- `enabled` (Boolean)
- `metric_key` (String)
- `value` (Block List)

#### Optional
- `dimensions` (List of String)
- `filters` (Block List)

#### Read-Only
- `id` (String)

#### Nested: `value`
- `type` (String)
- `field_name` (Optional)

#### Nested: `filters.filter`
- `field_name`, `operator`
- `value`, `value_in` (Optional)

---

## `dynatrace_user_experience_score`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Set thresholds and flags for user experience scoring.

### Schema

#### Required
- `consider_last_action` (Boolean)
- `consider_rage_click` (Boolean)
- `max_frustrated_user_actions_threshold` (Number)
- `min_satisfied_user_actions_threshold` (Number)

#### Read-Only
- `id` (String)

---

## `dynatrace_user_session_metrics`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Set `enabled`, `metric_key`, and `value.type`.
- Optionally define `dimensions` and `filters`.

### Schema

#### Required
- `enabled` (Boolean)
- `metric_key` (String)
- `value` (Block List)

#### Optional
- `dimensions` (List of String)
- `filters` (Block List)

#### Read-Only
- `id` (String)

---

## Data Sources

### `dynatrace_geo_countries`
- **Read-Only**: `countries` (List of `code`, `name`), `id`

### `dynatrace_geo_regions`
- **Required**: `country_code`
- **Read-Only**: `regions` (List of `code`, `name`), `id`

### `dynatrace_geo_cities`
- **Required**: `country_code`, `region_code`
- **Read-Only**: `cities` (List of `name`, `latitude`, `longitude`), `id`

---
