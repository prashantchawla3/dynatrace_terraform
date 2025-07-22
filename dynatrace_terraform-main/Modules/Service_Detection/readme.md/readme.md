# Dynatrace Terraform Modules - Detailed README

This Terraform configuration manages a wide range of Dynatrace services and detection rules using reusable modules. This README offers an in-depth explanation of each resource, variable, and their usage, making it easier for users to compare the code with the documentation.

---

## Table of Contents

* [Overview](#overview)
* [Modules and Resources](#modules-and-resources)

  * [Custom Services](#custom-services)
  * [Custom Service Order](#custom-service-order)
  * [Management Zones](#management-zones)
  * [External Web Requests](#external-web-requests)
  * [External Web Services](#external-web-services)
  * [Full Web Requests](#full-web-requests)
  * [Full Web Services](#full-web-services)
  * [Unified Services Metrics](#unified-services-metrics)
  * [Unified Services OpenTelemetry](#unified-services-opentelemetry)
  * [Service Detection Rules](#service-detection-rules)
  * [Service Splitting Rules](#service-splitting-rules)
* [Usage](#usage)
* [Examples](#examples)
* [Outputs](#outputs)

---

## Overview

This set of Terraform modules provisions Dynatrace monitoring configurations including:

* Custom service definitions (Java/.NET)
* Management zones
* Service detection and splitting rules
* Web request and service classification
* Unified service telemetry and metric integration

---

## Modules and Resources

### Custom Services

Creates custom service detection based on specified class and method rules per technology (e.g., Java or .NET).

**Resource:** `dynatrace_custom_service`

**Variables:**

```hcl
variable "custom_services" {
  type = list(object({
    name             = string
    technology       = string
    enabled          = bool
    queue_entry_point = bool
    rules = list(object({
      enabled     = bool
      class_name  = string
      class_match = string
      annotations = optional(list(string))
      methods     = list(object({
        name      = string
        arguments = optional(list(string))
        returns   = string
      }))
    }))
  }))
}
```

**Example:**

```hcl
custom_services = [
  {
    name = "java-first",
    technology = "java",
    enabled = true,
    queue_entry_point = false,
    rules = [
      {
        enabled = true,
        class_name = "com.example.MyClass",
        class_match = "EQUALS",
        methods = [
          {
            name = "myMethod",
            arguments = ["java.lang.String"],
            returns = "void"
          }
        ]
      }
    ]
  }
]
```

---

### Custom Service Order

Specifies the priority of custom service detection rules per technology.

**Resource:** `dynatrace_custom_service_order`

**Variable:**

```hcl
variable "custom_service_order" {
  type = object({
    dotnet = list(string),
    java   = list(string)
  })
}
```

**Example:**

```hcl
custom_service_order = {
  dotnet = ["dynatrace_custom_service.dotnet-first.id"],
  java   = ["dynatrace_custom_service.java-first.id"]
}
```

---

### Management Zones

Creates logical segmentation within Dynatrace using management zones with attribute-based rules.

**Resource:** `dynatrace_management_zone_v2`

**Variable:**

```hcl
variable "management_zones" {
  type = list(object({
    name = string,
    rules = list(object({
      type            = string,
      enabled         = bool,
      entity_selector = string,
      entity_type     = string,
      condition = object({
        case_sensitive = bool,
        key            = string,
        operator       = string,
        string_value   = string
      })
    }))
  }))
}
```

---

### External Web Requests

Detects external web requests using conditions and ID contributor rules.

**Resource:** `dynatrace_service_external_web_request`

**Variable:** `external_web_requests`

---

### External Web Services

Maps external services to web requests using advanced conditions and ID contributor transformations.

**Resource:** `dynatrace_service_external_web_service`

**Variable:** `external_web_services`

---

### Full Web Requests

Identifies full web requests and extracts ID contributor information using multiple transformation techniques.

**Resource:** `dynatrace_service_full_web_request`

**Variable:** `full_web_requests`

---

### Full Web Services

Classifies full web services with minimal configuration.

**Resource:** `dynatrace_service_full_web_service`

**Variable:** `full_web_services`

---

### Unified Services Metrics

Enables endpoint metrics for services in Dynatrace Unified Service Monitoring.

**Resource:** `dynatrace_unified_services_metrics`

**Variable:** `unified_services_metrics`

---

### Unified Services OpenTelemetry

Enables OpenTelemetry for unified services.

**Resource:** `dynatrace_unified_services_opentel`

**Variable:** `unified_services_opentel`

---

### Service Detection Rules

Creates rule-based service detection logic mapped to a Dynatrace scope.

**Resource:** `dynatrace_service_detection_rules`

**Variable:** `service_detection_rules`

---

### Service Splitting Rules

Splits detected services based on specified attribute keys.

**Resource:** `dynatrace_service_splitting`

**Variable:** `service_splitting_rules`

---

## How to Use

1. Update or use the provided `sample.tfvars` file in the root directory to supply values for the modules.
2. All modules are already called in the `main.tf` file in the root.
3. You only need to run the following commands to deploy:

```bash
terraform init
terraform plan -var-file="readme.md/sample.tfvars"
terraform apply -var-file="readme.md/sample.tfvars"
```

---

## Outputs

| Output Name                    | Description                           |
| ------------------------------ | ------------------------------------- |
| `custom_service_ids`           | IDs of the created custom services    |
| `management_zone_ids`          | IDs of the management zones created   |
| `external_web_request_ids`     | IDs of external web requests          |
| `external_web_service_ids`     | IDs of external web services          |
| `full_web_request_ids`         | IDs of full web requests              |
| `full_web_service_ids`         | IDs of full web services              |
| `service_detection_rule_ids`   | IDs of service detection rules        |
| `service_splitting_rule_ids`   | IDs of service splitting rules        |
| `unified_services_metrics_ids` | IDs of metrics-enabled services       |
| `unified_services_opentel_ids` | IDs of OpenTelemetry-enabled services |

---

## Notes

* This configuration does **not** include any sensitive information or secrets.
* Ensure API tokens or environment configuration is managed securely outside this code base.

---

