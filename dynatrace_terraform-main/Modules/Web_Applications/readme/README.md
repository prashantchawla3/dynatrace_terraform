# Dynatrace Web Application Modules - Terraform

This Terraform module suite provisions and configures a variety of Dynatrace Web Application settings, including application detection, custom metrics, error capture, JavaScript tag behavior, auto-injection rules, and Real User Monitoring (RUM) enablement.

Each module is designed to be reusable and driven by input variables, with output values to assist with downstream dependencies.

---

## Table of Contents

1. [Core Web Application Settings](#core-web-application-settings)
2. [Beacon Endpoints & Origins](#beacon-endpoints--origins)
3. [JavaScript Tag Versions & Updates](#javascript-tag-versions--updates)
4. [Auto & Custom Injection Rules](#auto--custom-injection-rules)
5. [RUM & Session Replay Enablement](#rum--session-replay-enablement)
6. [Performance Threshold Rules](#performance-threshold-rules)
7. [Custom & Request Error Logic](#custom--request-error-logic)
8. [Resource Cleanup & Classification](#resource-cleanup--classification)
9. [Detection Rule Configuration](#detection-rule-configuration)
10. [Event & Session Property Allow Lists](#event--session-property-allow-lists)
11. [Configuration Properties for Application](#configuration-properties-for-application)
12. [Calculated Metrics for Web UX](#calculated-metrics-for-web-ux)
13. [Key User Action Flags](#key-user-action-flags)

---

## Core Web Application Settings

**Module:** `web_application_core`

This module defines one or more Dynatrace web applications.

### Key Variables

* `web_applications`: A map of objects. Each key is an app name, and value is a complete app definition.
* `application_id`: Global application ID used across modules.

### Key Resources

* `dynatrace_web_application`: Creates or updates web app configurations including RUM settings, waterfall thresholds, monitoring logic, and Apdex thresholds.

### Example Input

```hcl
web_applications = {
  "example" = {
    name       = "Example Web App"
    type       = "AUTO_INJECTED"
    real_user_monitoring_enabled = true
    ...
  }
}
```

---

## Beacon Endpoints & Origins

**Module:** `web_beacons`

This module configures where JavaScript agents send beacon data and how beacon origins are matched.

### Key Variables

* `web_app_beacon_endpoints`: List of beacon endpoint definitions.
* `web_app_beacon_origins`: List of origin matchers (e.g., CONTAINS, EQUALS).

### Resources

* `dynatrace_web_app_beacon_endpoint`
* `dynatrace_web_app_beacon_origins`

### Example

```hcl
web_app_beacon_endpoints = [{
  application_id = "APPLICATION-XXXXX"
  url            = "/beacon"
  use_cors       = true
  type           = "ONEAGENT"
}]
```

---

## JavaScript Tag Versions & Updates

**Module:** `web_javascript_update`

Manages which JavaScript tag file and version is used by the application.

### Key Variables

* `javascript_filename`: Name of the JavaScript tag file.
* `custom_javascript_version`: Custom version ID.
* `javascript_version`: Version like `LATEST_STABLE` or a fixed string.
* `web_javascript_updates`: List of objects configuring updates per app.
* `web_javascript_versions`: List of JavaScript version objects.

### Resources

* `dynatrace_web_app_javascript_filename`
* `dynatrace_web_app_javascript_updates`
* `dynatrace_web_app_javascript_version`

---

## Auto & Custom Injection Rules

**Module:** `web_custom_injection`

Sets up rules for injecting JavaScript into HTML and configuring cookie attributes.

### Key Variables

* `web_app_custom_injections`: Defines custom rules for HTML injection.
* `web_app_injection_cookies`: Defines secure cookie handling per app.

### Resources

* `dynatrace_web_app_custom_injection`
* `dynatrace_web_app_injection_cookie`

---

## RUM & Session Replay Enablement

**Module:** `web_enablements`

Controls whether RUM and Session Replay are enabled per app.

### Variables

* `web_app_enablements`: List of objects that enable RUM and Session Replay.

### Resource

* `dynatrace_web_app_enablement`

---

## Performance Threshold Rules

**Module:** `web_kpm_thresholds`

Sets thresholds for Apdex evaluation in user experience.

### Key Variables

* `web_app_key_performance_customs`
* `web_app_key_performance_loads`
* `web_app_key_performance_xhrs`

### Resources

* `dynatrace_web_app_key_performance_custom`
* `dynatrace_web_app_key_performance_load`
* `dynatrace_web_app_key_performance_xhr`

---

## Custom & Request Error Logic

**Module:** `web_custom_errors`

Defines custom error detection logic and request error capturing.

### Variables

* `web_app_custom_errors`: List of scoped error rules.
* `web_app_request_errors`: List of HTTP request error rules.

### Resources

* `dynatrace_web_app_custom_errors`
* `dynatrace_web_app_request_errors`

---

## Resource Cleanup & Classification

**Module:** `web_resource_management`

Used for classifying resource types and cleaning up resource names.

### Variables

* `web_app_resource_cleanups`: Regex replacement rules.
* `web_resource_types`: Classifies JS, CSS, images, etc.
* `insert_after`, `primary_resource_type`, `secondary_resource_type`, `regular_expression`

### Resources

* `dynatrace_web_app_resource_cleanup`
* `dynatrace_web_app_resource_types`

---

## Detection Rule Configuration

**Module:** `web_detection_rules`

Configures rules that map user traffic to a Dynatrace application.

### Variables

* `application_identifier`, `filter_config`, `name`, `order`

### Resource

* `dynatrace_application_detection_rule_v2`

---

## Event & Session Property Allow Lists

**Module:** `web_custom_properties`

Allows certain custom event/session fields to be captured in Dynatrace.

### Variables

* `custom_event_properties_allow_list`: 2D list of allowed event fields.
* `custom_session_properties_allow_list`: 2D list of allowed session fields.

### Resource

* `dynatrace_web_app_custom_prop_restrictions`

---

## Configuration Properties for Application

**Module:** `web_config_properties`

Assigns simple key-value properties to web apps.

### Variables

* `custom_config_properties`: List of custom key-value properties scoped by application ID.

### Resource

* `dynatrace_web_app_custom_config_properties`

---

## Calculated Metrics for Web UX

**Module:** `web_calculated_metrics`

Creates custom metrics using dimensions and filters.

### Variables

* `calculated_web_metrics`: List of metric definitions, dimensions, filters.

### Resource

* `dynatrace_calculated_web_metric`

---

## Key User Action Flags

**Module:** `web_key_user_actions`

Flags specific user actions as key for performance tracking.

### Variables

* `key_user_actions`: List of application\_id, name, domain, type (e.g. Load).

### Resource

* `dynatrace_key_user_action`

---

>## How to Use

1. Update or use the provided `sample.tfvars` file in the root directory to supply values for the modules.
2. All modules are already called in the `main.tf` file in the root.
3. You only need to run the following commands to deploy:

```bash
terraform init
terraform plan -var-file="readme.md/sample.tfvars"
terraform apply -var-file="readme.md/sample.tfvars"
```

---