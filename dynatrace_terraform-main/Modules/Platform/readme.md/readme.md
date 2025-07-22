# Dynatrace Terraform Modules - Detailed Documentation
Each module corresponds to a specific Dynatrace resource and uses input variables to customize behavior. This README provides a detailed overview of each module, the resources they manage, and the purpose of each variable, so users can easily understand and apply them in their environments.

---

## Module: `dynatrace_grail_metrics_allowall`

### Purpose

Configures Grail to allow all metrics ingestion by default based on a boolean flag.

### Resource Used

```hcl
resource "dynatrace_grail_metrics_allowall" "this"
```

### Input Variable: `grail_allowall`

```hcl
variable "grail_allowall" {
  description = "Allow all configuration."
  type = map(object({
    allow_all = bool
  }))
}
```

#### Example Value

```hcl
grail_allowall = {
  default = {
    allow_all = true
  }
}
```

### Description

* `allow_all`: Set to `true` to allow all metrics to be ingested without restrictions. Set to `false` to restrict metric ingestion.

---

## Module: `dynatrace_grail_metrics_allowlist`

### Purpose

Defines a list of specific metrics that are allowed into Grail, controlled by rules.

### Resource Used

```hcl
resource "dynatrace_grail_metrics_allowlist" "this"
```

### Input Variable: `grail_allowlist`

```hcl
variable "grail_allowlist" {
  description = "Allow list configuration for Grail."
  type = map(object({
    allow_rules = list(object({
      enabled    = bool
      metric_key = string
      pattern    = string
    }))
  }))
}
```

#### Example Value

```hcl
grail_allowlist = {
  default = {
    allow_rules = [
      {
        enabled    = false
        metric_key = "terraform"
        pattern    = "CONTAINS"
      }
    ]
  }
}
```

### Description

* `allow_rules`: List of rules specifying which metrics to allow based on `metric_key` and `pattern`.

  * `enabled`: Whether this rule is active.
  * `metric_key`: The identifier of the metric.
  * `pattern`: Matching pattern (e.g., CONTAINS, STARTS\_WITH, etc.) for metric names.

---

## Module: `dynatrace_platform_bucket`

### Purpose

Defines custom data buckets in Dynatrace Grail for storing log data or other telemetry.

### Resource Used

```hcl
resource "dynatrace_platform_bucket" "this"
```

### Input Variable: `platform_buckets`

```hcl
variable "platform_buckets" {
  description = "Custom bucket definitions for Grail data."
  type = map(object({
    display_name = string
    retention    = number
    table        = string
  }))
}
```

#### Example Value

```hcl
platform_buckets = {
  logs_bucket = {
    display_name = "Custom logs bucket playground"
    retention    = 67
    table        = "logs"
  }
}
```

### Description

* `display_name`: User-friendly name for the bucket.
* `retention`: Number of days to retain data in the bucket.
* `table`: Table name where data will be stored (e.g., "logs").

### Output

```hcl
output "platform_bucket_names" {
  value = [for k, v in dynatrace_platform_bucket.this : v.name]
}
```

Returns a list of bucket names.

---

## Module: `dynatrace_problem_fields`

### Purpose

Maps event fields to problem fields to enrich problem records for better troubleshooting.

### Resource Used

```hcl
resource "dynatrace_problem_fields" "this"
```

### Input Variable: `problem_fields`

```hcl
variable "problem_fields" {
  description = "Problem field mapping rules."
  type = map(object({
    enabled       = bool
    event_field   = string
    problem_field = string
  }))
}
```

#### Example Value

```hcl
problem_fields = {
  example = {
    enabled       = false
    event_field   = "example_event"
    problem_field = "example_problem"
  }
}
```

### Description

* `enabled`: Whether the mapping rule is active.
* `event_field`: Field name in the incoming event.
* `problem_field`: Field in the Dynatrace problem record to map to.

### Output

```hcl
output "problem_field_statuses" {
  value = [for k, v in dynatrace_problem_fields.this : v.enabled]
}
```

Returns enabled status for each problem field rule.

---

## Module: `dynatrace_problem_record_propagation_rules`

### Purpose

Defines rules to propagate attributes from source to target in Dynatrace problem records.

### Resource Used

```hcl
resource "dynatrace_problem_record_propagation_rules" "this"
```

### Input Variable: `problem_propagation_rules`

```hcl
variable "problem_propagation_rules" {
  description = "Rules for propagating problems across attributes."
  type = map(object({
    enabled              = bool
    source_attribute_key = string
    target_attribute_key = string
  }))
}
```

#### Example Value

```hcl
problem_propagation_rules = {
  rule1 = {
    enabled              = false
    source_attribute_key = "terraformSource"
    target_attribute_key = "terraformTarget"
  }
}
```

### Description

* `enabled`: Whether propagation is enabled for this rule.
* `source_attribute_key`: Source attribute name to propagate from.
* `target_attribute_key`: Target attribute name to propagate to.

---


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

