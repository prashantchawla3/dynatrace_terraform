

# Dynatrace Terraform Modules

This repository provides a collection of reusable Terraform modules for managing various Dynatrace configurations, including calculated metrics, request attributes, service naming rules, API detection, key requests, muted requests, and more.

---

##  Module Overview

| Module                                | Description                                                                    |
| ------------------------------------- | ------------------------------------------------------------------------------ |
| `dynatrace_api_detection`             | Configures Dynatrace API detection rules to control how services are detected. |
| `dynatrace_key_requests`              | Manages key requests in Dynatrace to ensure specific requests are prioritized. |
| `dynatrace_request_attribute`         | Defines custom request attributes for fine-grained service/request monitoring. |
| `dynatrace_request_namings`           | Manages naming rules for requests to improve traceability and readability.     |
| `dynatrace_service-naming`            | Configures service naming rules for more meaningful service names.             |
| `dynatrace_calculated_service_metric` | Defines calculated metrics for services using custom criteria.                 |
| `dynatrace_muted_requests`            | Excludes specified request names from visibility or alerting.                  |
| `dynatrace_request_naming`            | Defines individual naming rules for requests.                                  |
| `dynatrace_service_naming_order`      | Sets the order of service naming rules to define precedence.                   |
| `dynatrace_url_based_sampling`        | Configures sampling based on URL patterns to manage data ingestion volume.     |

---

##  Usage Example (Root Module)

```hcl
module "api_detection" {
  source = "./modules/dynatrace_api_detection"
  # add required variables here
}

module "key_requests" {
  source = "./modules/dynatrace_key_requests"
  # add required variables here
}

# Repeat similarly for other modules
```

---

##  Module Details

### 1. dynatrace\_api\_detection

**Resource**: `dynatrace_api_detection`

**Description**: Controls how API endpoints are detected and grouped into services.

**Example Variables**:

```hcl
variable "api_detection_rules" {
  type = list(object({
    # Define rule structure
  }))
  description = "List of API detection rules."
}
```

---

### 2. dynatrace\_key\_requests

**Resource**: `dynatrace_key_requests`

**Description**: Promotes specific service requests to key requests for prioritized analysis.

**Example Variable**:

```hcl
variable "key_requests" {
  type = list(object({
    service_id = string
    request_id = string
  }))
  description = "List of key requests to highlight."
}
```

---

### 3. dynatrace\_request\_attribute

**Resource**: `dynatrace_request_attribute`

**Description**: Adds custom attributes to requests for filtering and analysis.

**Example Variable**:

```hcl
variable "request_attributes" {
  type = list(object({
    name     = string
    enabled  = bool
    data_type = string
  }))
  description = "Defines request attributes."
}
```

---

### 4. dynatrace\_request\_namings

**Resource**: `dynatrace_request_namings`

**Description**: Groups multiple naming rules under one configuration.

**Variable**:

```hcl
variable "request_naming_ids" {
  type = list(string)
  description = "IDs of request naming rules to include in the set."
}
```

---

### 5. dynatrace\_service-naming

**Resource**: `dynatrace_service_naming`

**Description**: Defines rules to name services in a consistent and readable manner.

**Variable**:

```hcl
variable "service_naming_rules" {
  type = list(object({
    name = string
    rule = string
  }))
  description = "List of service naming rules."
}
```

---

### 6. dynatrace\_calculated\_service\_metric

**Resource**: `dynatrace_calculated_service_metric`

**Description**: Creates custom metrics derived from service-level data.

**Variables**:

```hcl
variable "service_id" {
  description = "Service ID for the calculated metric."
  type        = string
}

variable "metric_key" {
  description = "Unique key for the metric."
  type        = string
}
```

---

### 7. dynatrace\_muted\_requests

**Resource**: `dynatrace_muted_requests`

**Description**: Disables visibility or alerting for specific request names.

**Variables**:

```hcl
variable "service_id" {
  type        = string
  description = "ID of the service to mute requests for."
}

variable "muted_request_names" {
  type        = list(string)
  description = "List of request names to be muted."
  default     = []
}
```

---

### 8. dynatrace\_request\_naming

**Resource**: `dynatrace_request_naming`

**Description**: Creates individual request naming rules.

**Variable**:

```hcl
variable "request_naming_rule" {
  type = object({
    name       = string
    conditions = list(string)
  })
  description = "Request naming rule configuration."
}
```

---

### 9. dynatrace\_service\_naming\_order

**Resource**: `dynatrace_service_naming_order`

**Description**: Controls the order in which service naming rules are applied.

**Variable**:

```hcl
variable "service_naming_rule_ids" {
  type        = list(string)
  description = "Ordered list of service naming rule IDs."
}
```

---

### 10. dynatrace\_url\_based\_sampling

**Resource**: `dynatrace_url_based_sampling`

**Description**: Samples data based on URL patterns to reduce data volume while preserving important data.

**Variables**:

```hcl
variable "url_based_sampling_enabled" {
  type        = bool
  default     = true
  description = "Enable or disable URL-based sampling."
}

variable "url_based_sampling_factor" {
  type        = number
  default     = 10
  description = "Sampling factor (e.g., 10 = 1 of every 10 requests)."
}

variable "url_based_sampling_http_method_any" {
  type        = bool
  default     = true
  description = "Apply to all HTTP methods."
}

variable "url_based_sampling_ignore" {
  type        = bool
  default     = false
  description = "Whether to ignore sampling for the path."
}

variable "url_based_sampling_path" {
  type        = string
  description = "Path pattern to match."
}

variable "url_based_sampling_path_comparison_type" {
  type        = string
  default     = "BEGINS_WITH"
  description = "Comparison type (e.g., BEGINS_WITH, CONTAINS)."
}

variable "query_parameter_name" {
  type        = string
  default     = ""
  description = "Name of the query parameter."
}

variable "query_parameter_value" {
  type        = string
  default     = ""
  description = "Value of the query parameter."
}

variable "query_parameter_value_is_undefined" {
  type        = bool
  default     = false
  description = "Set true if parameter value is undefined."
}
```

---



##  Outputs

Each module may expose specific output values such as resource IDs, which you can use for chaining resources. Refer to each module’s `outputs.tf` for details.

---

##  Best Practices

* Always validate your `.tfvars` using `terraform plan`.
* Follow naming conventions for rule clarity.
* Use `count` or `for_each` to modularize dynamic rules.
* Keep secrets out of Git using `.gitignore` and environment variables.

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