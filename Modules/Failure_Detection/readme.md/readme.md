
#  Dynatrace Failure Detection Modules

This Terraform module suite configures custom failure detection logic in Dynatrace. It enables fine-grained control over which exceptions, HTTP responses, and conditions should be marked as failures — at both global and service levels.

---

##  Module Breakdown

### 1. `dynatrace_failure_detection_parameters`

Defines shared/global failure detection logic and exception handling rules.

### 2. `dynatrace_failure_detection_rules`

Applies custom rule-based conditions for marking transactions as failures.

### 3. `dynatrace_service_failure`

Enables service-level failure detection toggles.

### 4. `dynatrace_service_http_failure`

Configures service-level HTTP failure handling and broken link recognition.

---

##  Module: `failure_detection_parameters`

###  Purpose

Declares shared failure detection policies including:
- Exception handling
- HTTP 404 treatment
- Custom attribute rules
- Response code absence detection

###  Variables

| Variable | Type | Description | Example |
|---------|------|-------------|---------|
| `failure_detection_parameters_enabled` | `bool` | Enables the configuration | `true` |
| `failure_detection_parameters_name` | `string` | Name of the parameter set | `"default-failure-detection"` |
| `failure_detection_parameters_description` | `string` | Freeform description | `"Handles standard exceptions and 404s"` |
| `http_404_not_found_failures` | `bool` | Marks HTTP 404s as failures | `true` |
| `ignore_all_exceptions` | `bool` | Ignores all exceptions (overrides custom handling) | `false` |
| `ignore_span_failure_detection` | `bool` | Disables span-based failure detection logic | `false` |
| `custom_error_rules` | `list(object)` | Adds request attribute-based failure detection rules | See below |
| `custom_handled_exceptions` | `list(object)` | Gracefully handles matching exceptions | See below |
| `ignored_exceptions` | `list(object)` | Skips listed exceptions from detection | See below |
| `success_forcing_exceptions` | `list(object)` | Exceptions that force success state | See below |
| `client_side_errors`, `server_side_errors` | `string` | Class pattern identifiers | `"ClientError"`, `"ServerError"` |
| `fail_on_missing_response_code_client_side` | `bool` | Marks missing client-side response codes as failures | `false` |
| `fail_on_missing_response_code_server_side` | `bool` | Same logic for server-side failures | `false` |
| `existing_failure_detection_parameters_name` | `string` | Reference name for importing existing parameter sets | `""` |

####  Custom Error Rules Example
```hcl
custom_error_rules = [
  {
    request_attribute       = "http.status"
    compare_operation_type  = "EQUALS"
    case_sensitive          = true
    text_value              = "500"
  }
]
```

---

##  Module: `failure_detection_rules`

###  Purpose

Applies transaction failure logic using custom predicates on attributes.

###  Variables

| Variable | Type | Description | Example |
|----------|------|-------------|---------|
| `failure_detection_rules_enabled` | `bool` | Toggle for applying the ruleset | `true` |
| `failure_detection_rules_name`    | `string` | Name for ruleset | `"service-failure-ruleset"` |
| `failure_conditions`              | `list(object)` | List of match conditions for failure logic | See example below |

####  Failure Conditions Example
```hcl
failure_conditions = [
  {
    attribute       = "response.status"
    case_sensitive  = false
    predicate_type  = "CONTAINS"
    text_values     = ["ERROR", "FAIL"]
  }
]
```

---

##  Module: `service_failure_toggle`

###  Purpose

Enables or disables service-level failure detection for a given service ID.

###  Variables

| Variable | Type | Description | Example |
|----------|------|-------------|---------|
| `service_failure_enabled` | `bool` | Turns failure detection on/off for service | `true` |
| `service_id`              | `string` | Unique Dynatrace service identifier | `"SERVICE-ABC123"` |

---

##  Module: `service_http_failure`

###  Purpose

Applies HTTP-specific failure detection logic, including support for broken link domains.

###  Variables

| Variable | Type | Description | Example |
|----------|------|-------------|---------|
| `service_http_failure_enabled` | `bool` | Toggles HTTP error handling for service | `true` |
| `broken_link_domains`          | `list(string)` | List of domains flagged as broken link errors | `["example-broken.com"]` |
| `service_id`                   | `string` | Shared service identifier | `"SERVICE-ABC123"` |

---

##  Outputs

| Output Name                            | Description                                      |
|----------------------------------------|--------------------------------------------------|
| `failure_detection_parameters_id`      | ID of the shared parameter block                |
| `failure_detection_rules_id`           | ID of the ruleset block                         |
| `service_failure_id`                   | ID of the basic service failure config          |
| `service_http_failure_id`              | ID of the service HTTP detection config         |
| `example_failure_detection_parameters_id` | ID from imported/lookup parameter set          |

All outputs can be referenced in dashboards, documentation, or downstream service binding.

---

##  Example Usage in `main.tf`

```hcl
module "failure_detection_parameters" {
  source = "./modules/dynatrace_failure_detection_parameters"
  failure_detection_parameters_enabled = true
  failure_detection_parameters_name = "custom-detection"
  http_404_not_found_failures = true
  ignored_exceptions = [
    { class_pattern = "IgnoreMeException", message_pattern = "minor issue" }
  ]
  ...
}

module "service_http_failure" {
  source = "./modules/dynatrace_service_failure"
  service_http_failure_enabled = true
  broken_link_domains = ["archive.site.com"]
  service_id = "SERVICE-XYZ"
}
```

---


