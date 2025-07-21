

# Dynatrace Terraform Resources

---

## `dynatrace_application_detection_rule_v2`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Use the Dynatrace UI or API to retrieve the `application_id`, `matcher`, and `pattern` values. These define how applications are detected.

### Full Schema

- **Required**
  - `application_id` (string)
  - `matcher` (string)
  - `pattern` (string)
- **Optional**
  - None
- **Read-Only**
  - `id`
- **Nested**
  - None

### Using Data Blocks

Use `data "dynatrace_application_detection_rule_v2"` to retrieve existing detection rules.

---

## `dynatrace_web_app_custom_config_properties`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Use the Dynatrace UI to identify the `application_id` and define custom properties in `key=value` format.

### Full Schema

- **Required**
  - `application_id` (string)
  - `custom_property` (string)
- **Optional**
  - None
- **Read-Only**
  - `id`
- **Nested**
  - None

### Using Data Blocks

Use `data "dynatrace_web_app_custom_config_properties"` to retrieve existing custom config properties.

---

## `dynatrace_application_error_rules`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Define `web_application_id` and optionally configure `custom_errors` and `http_errors` blocks.

### Full Schema

- **Required**
  - `web_application_id` (string)
- **Optional**
  - `custom_errors`
  - `http_errors`
- **Read-Only**
  - `id`
- **Nested**
  - `custom_errors.rule`
  - `http_errors.rule`

### Using Data Blocks

Use `data "dynatrace_application_error_rules"` to retrieve existing error rules.

---

## `dynatrace_calculated_web_metric`

### Required API Token Scopes

- `Read metrics`
- `Write metrics`

### Guidance on tfvars Values

Use the Dynatrace UI to define `app_identifier`, `metric_key`, `name`, and optional filters and dimensions.

### Full Schema

- **Required**
  - `app_identifier` (string)
  - `metric_key` (string)
  - `name` (string)
- **Optional**
  - `enabled` (bool)
  - `dimensions`
  - `metric_definition`
  - `user_action_filter`
- **Read-Only**
  - `id`
- **Nested**
  - `dimensions.dimension`
  - `metric_definition.metric`
  - `user_action_filter`

### Using Data Blocks

Use `data "dynatrace_calculated_web_metric"` to retrieve existing metrics.

---

## `dynatrace_key_user_action`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Use the Dynatrace UI to identify the `application_id`, `domain`, and `name` of the user action.

### Full Schema

- **Required**
  - `application_id` (string)
  - `domain` (string)
  - `name` (string)
  - `type` (string)
- **Optional**
  - None
- **Read-Only**
  - `id`
- **Nested**
  - None

### Using Data Blocks

Use `data "dynatrace_key_user_action"` to retrieve existing key user actions.



## `dynatrace_web_app_auto_injection`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Use the Dynatrace UI to determine the `application_id` and configure optional nested blocks like `cache_control_headers`, `monitoring_code_source_section`, and `snippet_format`.

### Full Schema

- **Required**
  - `application_id` (string)
- **Optional**
  - `cache_control_headers`
  - `monitoring_code_source_section`
  - `snippet_format`
- **Read-Only**
  - `id`
- **Nested**
  - `cache_control_headers.cache_control_headers`
  - `monitoring_code_source_section.code_source`
  - `monitoring_code_source_section.monitoring_code_path`
  - `snippet_format.code_snippet_type`
  - `snippet_format.snippet_format`

### Using Data Blocks

Use `data "dynatrace_web_app_auto_injection"` to retrieve existing settings.

---

## `dynatrace_web_app_beacon_endpoint`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Specify the `application_id`, `type`, `url`, and `use_cors` based on your beacon endpoint configuration in Dynatrace.

### Full Schema

- **Required**
  - `application_id` (string)
  - `type` (string)
  - `url` (string)
  - `use_cors` (bool)
- **Optional**
  - None
- **Read-Only**
  - `id`
- **Nested**
  - None

### Using Data Blocks

Use `data "dynatrace_web_app_beacon_endpoint"` to retrieve existing beacon endpoints.

---

## `dynatrace_web_app_beacon_origins`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Define the `matcher` and `pattern` to specify which origins are allowed for beacon data.

### Full Schema

- **Required**
  - `matcher` (string)
  - `pattern` (string)
- **Optional**
  - None
- **Read-Only**
  - `id`
- **Nested**
  - None

### Using Data Blocks

Use `data "dynatrace_web_app_beacon_origins"` to retrieve existing origin configurations.

---

## `dynatrace_web_app_custom_errors`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Use the Dynatrace UI to define `scope`, `ignore_custom_errors_in_apdex_calculation`, and nested `error_rules`.

### Full Schema

- **Required**
  - `scope` (string)
  - `ignore_custom_errors_in_apdex_calculation` (bool)
- **Optional**
  - `error_rules`
- **Read-Only**
  - `id`
- **Nested**
  - `error_rules.key_matcher`
  - `error_rules.key_pattern`
  - `error_rules.value_matcher`
  - `error_rules.value_pattern`
  - `error_rules.capture_settings.capture`
  - `error_rules.capture_settings.consider_for_ai`
  - `error_rules.capture_settings.impact_apdex`

### Using Data Blocks

Use `data "dynatrace_web_app_custom_errors"` to retrieve existing custom error rules.

---


---

## `dynatrace_web_app_custom_injection`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Use the Dynatrace UI to configure custom injection rules, including `application_id`, `enabled`, `operator`, `url_pattern`, and HTML injection settings.

### Full Schema

- **Required**
  - `application_id` (string)
  - `enabled` (bool)
  - `operator` (string)
  - `url_pattern` (string)
  - `rule` (string)
  - `html_pattern` (string)
- **Optional**
  - `insert_after` (string)
- **Read-Only**
  - `id`
- **Nested**
  - None

### Using Data Blocks

Use `data "dynatrace_web_app_custom_injection"` to retrieve existing injection rules.

---

## `dynatrace_web_app_enablement`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Define `application_id` and optionally configure `rum` and `session_replay` settings.

### Full Schema

- **Required**
  - `application_id` (string)
- **Optional**
  - `rum`
  - `session_replay`
- **Read-Only**
  - `id`
- **Nested**
  - `rum.enabled`
  - `rum.cost_and_traffic_control`
  - `rum.enabled_on_grail`
  - `session_replay.enabled`
  - `session_replay.cost_and_traffic_control`

### Using Data Blocks

Use `data "dynatrace_web_app_enablement"` to retrieve existing enablement settings.

---

## `dynatrace_web_app_injection_cookie`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Specify the `application_id`, `same_site_cookie_attribute`, and `use_secure_cookie_attribute` for cookie injection behavior.

### Full Schema

- **Required**
  - `application_id` (string)
  - `same_site_cookie_attribute` (string)
  - `use_secure_cookie_attribute` (bool)
- **Optional**
  - None
- **Read-Only**
  - `id`
- **Nested**
  - None

### Using Data Blocks

Use `data "dynatrace_web_app_injection_cookie"` to retrieve existing cookie settings.

---

## `dynatrace_web_app_key_performance_custom`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Define `scope` and `thresholds` for custom key performance metrics.

### Full Schema

- **Required**
  - `scope` (string)
- **Optional**
  - `thresholds`
- **Read-Only**
  - `id`
- **Nested**
  - `thresholds.frustrating_threshold_seconds`
  - `thresholds.tolerated_threshold_seconds`

### Using Data Blocks

Use `data "dynatrace_web_app_key_performance_custom"` to retrieve existing performance thresholds.

---

---

## `dynatrace_web_app_key_performance_load`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Define `kpm`, `scope`, and optionally `thresholds` and `fallback_thresholds` for load action performance metrics.

### Full Schema

- **Required**
  - `kpm` (string)
  - `scope` (string)
- **Optional**
  - `thresholds`
  - `fallback_thresholds`
- **Read-Only**
  - `id`
- **Nested**
  - `thresholds.frustrating_threshold_seconds`
  - `thresholds.tolerated_threshold_seconds`
  - `fallback_thresholds.frustrating_fallback_threshold_seconds`
  - `fallback_thresholds.tolerated_fallback_threshold_seconds`

### Using Data Blocks

Use `data "dynatrace_web_app_key_performance_load"` to retrieve existing load performance thresholds.

---

## `dynatrace_web_app_key_performance_xhr`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Define `kpm`, `scope`, and optionally `thresholds` and `fallback_thresholds` for XHR action performance metrics.

### Full Schema

- **Required**
  - `kpm` (string)
  - `scope` (string)
- **Optional**
  - `thresholds`
  - `fallback_thresholds`
- **Read-Only**
  - `id`
- **Nested**
  - `thresholds.frustrating_threshold_seconds`
  - `thresholds.tolerated_threshold_seconds`
  - `fallback_thresholds.frustrating_fallback_threshold_seconds`
  - `fallback_thresholds.tolerated_fallback_threshold_seconds`

### Using Data Blocks

Use `data "dynatrace_web_app_key_performance_xhr"` to retrieve existing XHR performance thresholds.

---

## `dynatrace_web_app_request_errors`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Define `scope`, `ignore_request_errors_in_apdex_calculation`, and optionally configure `error_rules`.

### Full Schema

- **Required**
  - `scope` (string)
  - `ignore_request_errors_in_apdex_calculation` (bool)
- **Optional**
  - `error_rules`
- **Read-Only**
  - `id`
- **Nested**
  - `error_rules.consider_csp_violations`
  - `error_rules.consider_failed_images`
  - `error_rules.error_codes`
  - `error_rules.capture_settings.capture`
  - `error_rules.capture_settings.consider_for_ai`
  - `error_rules.capture_settings.impact_apdex`
  - `error_rules.filter_settings.filter`
  - `error_rules.filter_settings.url`

### Using Data Blocks

Use `data "dynatrace_web_app_request_errors"` to retrieve existing request error rules.

---

## `dynatrace_web_app_resource_cleanup`

### Required API Token Scopes

- `Read settings`
- `Write settings`

### Guidance on tfvars Values

Define `name`, `regular_expression`, `replace_with`, and optionally `insert_after` to configure resource cleanup rules.

### Full Schema

- **Required**
  - `name` (string)
  - `regular_expression` (string)
  - `replace_with` (string)
- **Optional**
  - `insert_after` (string)
- **Read-Only**
  - `id`
- **Nested**
  - None

### Using Data Blocks

Use `data "dynatrace_web_app_resource_cleanup"` to retrieve existing cleanup rules.

---
