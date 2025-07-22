
#  Dynatrace Mobile Monitoring & RUM Modules

This Terraform module collection provisions Dynatrace mobile monitoring resources, enabling advanced Real User Monitoring (RUM), crash analysis, error tracking, and performance thresholding across mobile and custom apps.

It is structured around composable modules for:
- Calculated mobile metrics
- RUM enablement
- Key performance thresholds
- Request error rules
- Mobile app instrumentation



##  Modules Overview

### 1. `dynatrace_calculated_mobile_metrics`

####  What it does
Creates calculated metrics for mobile apps using selected dimensions and thresholds, to track behaviors like crash rate, latency, or engagement across OS or regions.

####  Variable: `calculated_mobile_metrics`

| Field        | Type              | Description |
|-------------|-------------------|-------------|
| `enabled`        | `bool`           | Enable calculated metric |
| `app_identifier` | `string`         | ID of mobile app (e.g. `MOBILE-APP-001`) |
| `metric_key`     | `string`         | Logical identifier for the custom metric |
| `metric_type`    | `string`         | Type of metric, like `CUSTOM`, `BUILTIN` |
| `dimensions`     | `list(object)`   | Dimensions with top-X thresholds |



####  Output
- `calculated_mobile_metric_ids`: Map of metric IDs by key

---

### 2. `dynatrace_custom_app_enablement`

####  What it does
Enables RUM for non-standard applications like single-page or serverless apps.

####  Variable: `custom_app_enablements`

| Field                         | Type       | Description |
|------------------------------|------------|-------------|
| `scope`                      | `string`   | Entity scope identifier |
| `rum.enabled`                | `bool`     | Enable RUM |
| `rum.cost_and_traffic_control` | `number` | Estimated traffic budget |


####  Output
- `custom_app_enablement_scopes`: App scopes enabled for RUM

---

### 3. `dynatrace_mobile_app_key_performance`

####  What it does
Configures thresholds for frustrational and tolerable app behavior using APDEX-like measurements.

####  Variable: `mobile_app_key_performance`

| Field   | Type         | Description |
|--------|--------------|-------------|
| `frustrating_if_reported_or_web_request_error` | `bool` | Flag failure state as frustration |
| `scope`                                      | `string` | Target app |
| `thresholds.frustrating_threshold_seconds`  | `number` | Time above which experience is "frustrating" |
| `thresholds.tolerable_threshold_seconds`    | `number` | Time between tolerable and frustrating |


####  Output
- `mobile_app_key_performance_scopes`: App scopes with thresholds applied

---

### 4. `dynatrace_mobile_app_request_errors`

####  What it does
Defines error codes for mobile apps (e.g. HTTP 401, 404) to be tracked as problem indicators.

####  Variable: `mobile_app_request_errors`

| Field       | Type               | Description |
|------------|--------------------|-------------|
| `scope`     | `string`           | App scope |
| `error_rules` | `list(object)`   | List of error codes to monitor |


####  Output
- `mobile_app_request_error_scopes`: Scopes with error rules applied

---

### 5. `dynatrace_mobile_app_key_performance` (also reused under `mobile_app_enablements`)

####  What it does
This dual-use module also enables:
- RUM with session sampling control
- Session replay on crash
####  Variable: `mobile_app_enablements`

| Field        | Type               | Description |
|-------------|--------------------|-------------|
| `rum.enabled` | `bool`            | Enables RUM |
| `rum.cost_and_traffic_control` | `number`     | Sampling % |
| `session_replay.on_crash` | `bool`          | Enable replay when app crashes |



####  Output
- `mobile_app_enablement_status`: Shows whether each app has RUM enabled

---

### 6. `dynatrace_mobile_application`

####  What it does
Creates or configures a mobile app in Dynatrace with full instrumentation settings: endpoints, session % tracking, APDEX, and attribute extraction.

####  Variable: `mobile_applications`

| Field                    | Type       | Description |
|--------------------------|------------|-------------|
| `beacon_endpoint_type`   | `string`   | `CLUSTER`, `ENVIRONMENT`, etc. |
| `beacon_endpoint_url`    | `string`   | App's data collection endpoint |
| `user_session_percentage`| `number`   | % of users tracked |
| `apdex.frustrated`       | `number`   | ms after which user is frustrated |
| `apdex.tolerable`        | `number`   | ms for tolerable response |
| `apdex.frustrated_on_error` | `bool` | If true, errors are treated as frustration |
| `properties.api_values` | list(object) | Defines custom API metadata for tracking |
| `properties.request_attributes` | list(object) | Session/user attributes to extract from requests |


####  Output
- `mobile_application_names`: Registered Dynatrace mobile app names

---

##  How to Use

Each module takes a `map(object)` input keyed by a unique identifier (`app1`, `custom1`, etc.). They are called independently in `main.tf`, so resources are modular.

Example in `main.tf`:
```hcl
module "calculated_mobile_metrics" {
  source = "./modules/dynatrace_calculated_mobile_metrics"
  calculated_mobile_metrics = var.calculated_mobile_metrics
}
```

---

