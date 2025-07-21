

# Dynatrace Terraform Resources

---

## `dynatrace_failure_detection_parameters`

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**Dynatrace Documentation:**
- https://www.dynatrace.com/support/help/platform-modules/applications-and-microservices/services/service-monitoring-settings/configure-service-failure-detection  
- https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings (schemaId: builtin:failure-detection.environment.parameters)

**Schema:**

- **Required:**
  - `name` (String)
  - `broken_links` (Block)
    - `http_404_not_found_failures` (Boolean)
    - `broken_link_domains` (Set of String, Optional)
  - `exception_rules` (Block)
    - `ignore_all_exceptions` (Boolean)
    - `ignore_span_failure_detection` (Boolean)
    - `custom_error_rules` (Block, Optional)
      - `custom_error_rule` (Block)
        - `request_attribute` (String)
        - `condition` (Block)
          - `compare_operation_type` (String)
          - `case_sensitive` (Boolean, Optional)
          - `double_value` (Number, Optional)
          - `int_value` (Number, Optional)
          - `text_value` (String, Optional)
    - `custom_handled_exceptions` (Block, Optional)
      - `custom_handled_exception` (Block)
        - `class_pattern` (String, Optional)
        - `message_pattern` (String, Optional)
    - `ignored_exceptions` (Block, Optional)
      - `custom_handled_exception` (Block)
        - `class_pattern` (String, Optional)
        - `message_pattern` (String, Optional)
    - `success_forcing_exceptions` (Block, Optional)
      - `custom_handled_exception` (Block)
        - `class_pattern` (String, Optional)
        - `message_pattern` (String, Optional)
  - `http_response_codes` (Block)
    - `client_side_errors` (String)
    - `fail_on_missing_response_code_client_side` (Boolean)
    - `fail_on_missing_response_code_server_side` (Boolean)
    - `server_side_errors` (String)

- **Optional:**
  - `description` (String)

- **Read-Only:**
  - `id` (String)

---

## `dynatrace_failure_detection_rules`

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**Dynatrace Documentation:**
- https://www.dynatrace.com/support/help/platform-modules/applications-and-microservices/services/service-monitoring-settings/configure-service-failure-detection  
- https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings (schemaId: builtin:failure-detection.environment.rules)

**Schema:**

- **Required:**
  - `name` (String)
  - `enabled` (Boolean)
  - `parameter_id` (String)
  - `conditions` (Block)
    - `condition` (Block)
      - `attribute` (String)
      - `predicate` (Block)
        - `predicate_type` (String)
        - `case_sensitive` (Boolean, Optional)
        - `management_zones` (Set of String, Optional)
        - `service_type` (Set of String, Optional)
        - `tag_keys` (Set of String, Optional)
        - `tags` (Set of String, Optional)
        - `text_values` (Set of String, Optional)

- **Optional:**
  - `description` (String)
  - `insert_after` (String)

- **Read-Only:**
  - `id` (String)

---

## `dynatrace_service_failure`

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**Dynatrace Documentation:**
- https://www.dynatrace.com/support/help/platform-modules/applications-and-microservices/services/service-monitoring-settings/configure-service-failure-detection  
- https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings (schemaId: builtin:failure-detection.service.general-parameters)

**Schema:**

- **Required:**
  - `enabled` (Boolean)
  - `service_id` (String)

- **Optional:**
  - `exception_rules` (Block)
    - `ignore_all_exceptions` (Boolean)
    - `ignore_span_failure_detection` (Boolean)
    - `custom_error_rules` (Block, Optional)
      - `custom_error_rule` (Block)
        - `request_attribute` (String)
        - `condition` (Block)
          - `compare_operation_type` (String)
          - `case_sensitive` (Boolean, Optional)
          - `double_value` (Number, Optional)
          - `int_value` (Number, Optional)
          - `text_value` (String, Optional)
    - `custom_handled_exceptions` (Block, Optional)
      - `custom_handled_exception` (Block)
        - `class_pattern` (String, Optional)
        - `message_pattern` (String, Optional)
    - `ignored_exceptions` (Block, Optional)
      - `custom_handled_exception` (Block)
        - `class_pattern` (String, Optional)
        - `message_pattern` (String, Optional)
    - `success_forcing_exceptions` (Block, Optional)
      - `custom_handled_exception` (Block)
        - `class_pattern` (String, Optional)
        - `message_pattern` (String, Optional)

- **Read-Only:**
  - `id` (String)

---

## `dynatrace_service_http_failure`

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**Dynatrace Documentation:**
- https://www.dynatrace.com/support/help/platform-modules/applications-and-microservices/services/service-monitoring-settings/configure-service-failure-detection  
- https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings (schemaId: builtin:failure-detection.service.http-parameters)

**Schema:**

- **Required:**
  - `enabled` (Boolean)
  - `service_id` (String)

- **Optional:**
  - `broken_links` (Block)
    - `http_404_not_found_failures` (Boolean)
    - `broken_link_domains` (Set of String, Optional)
  - `http_response_codes` (Block)
    - `client_side_errors` (String)
    - `fail_on_missing_response_code_client_side` (Boolean)
    - `fail_on_missing_response_code_server_side` (Boolean)
    - `server_side_errors` (String)

- **Read-Only:**
  - `id` (String)

---

## `data.dynatrace_failure_detection_parameters`

**Purpose:**  
Retrieve the failure detection parameter ID by name.

**Schema:**

- **Required:**
  - `name` (String)

- **Read-Only:**
  - `id` (String)

---
