# Dynatrace Terraform Modules README

This  contains modular Terraform configurations for provisioning and managing Dynatrace Real User Monitoring (RUM), geolocation settings, user behavior analytics, and more. Each module represents a logical unit of configuration with a clear and well-documented interface.

---

##  Module: `dynatrace_geolocation`

### Description

Manages geolocation settings in Dynatrace. Used to enable or disable display of the world map and define the data scope.

### Variables

```hcl
variable "geolocation" {
  type = map(object({
    display_worldmap = bool
    scope            = string
  }))
  description = "Controls display of world map and defines the scope for geolocation data."
}
```

#### Example

```hcl
geolocation = {
  geo1 = {
    display_worldmap = true
    scope            = "environment"
  }
}
```

---

##  Module: `dynatrace_process_group_rum`

### Description

Enables or disables Real User Monitoring (RUM) for specific Dynatrace process groups.

### Variables

```hcl
variable "process_group_rum" {
  type = map(object({
    enable           = bool
    process_group_id = string
  }))
  description = "Configures RUM for specified process groups."
}
```

#### Example

```hcl
process_group_rum = {
  pgr1 = {
    enable           = false
    process_group_id = "PROCESS_GROUP-1234567890000000"
  }
}
```

---

##  Module: `dynatrace_rum_advanced_correlation`

### Description

Sets up advanced RUM correlation using HTTP header matchers and patterns.

### Variables

```hcl
variable "rum_advanced_correlation" {
  type = map(object({
    matcher = string
    pattern = string
  }))
  description = "Sets advanced correlation rules for RUM using matchers and patterns."
}
```

#### Example

```hcl
rum_advanced_correlation = {
  rac1 = {
    matcher = "STARTS_WITH"
    pattern = "Server-Timing-Terraform-2"
  }
}
```

---

##  Module: `dynatrace_rum_host_headers`

### Description

Defines HTTP headers used for host identification in RUM.

### Variables

```hcl
variable "rum_host_headers" {
  type = map(object({
    header_name = string
  }))
  description = "Configures the host header name used in RUM settings."
}
```

#### Example

```hcl
rum_host_headers = {
  rhh1 = {
    header_name = "example-header"
  }
}
```

---

##  Module: `dynatrace_rum_ip_determination`

### Description

Specifies custom headers for determining the client IP in RUM.

### Variables

```hcl
variable "rum_ip_determination" {
  type = map(object({
    header_name = string
  }))
  description = "Defines headers used to determine IP addresses for RUM."
}
```

#### Example

```hcl
rum_ip_determination = {
  rid1 = {
    header_name = "X-Header-Example3"
  }
}
```

---

##  Module: `dynatrace_rum_ip_locations`

### Description

Maps static IP ranges to specific locations.

### Variables

```hcl
variable "rum_ip_locations" {
  type = map(object({
    country_code = string
    ip           = string
    ip_to        = string
    region_code  = string
  }))
  description = "Defines static IP location mappings for RUM."
}
```

#### Example

```hcl
rum_ip_locations = {
  ril1 = {
    country_code = "ZA"
    ip           = "192.168.3.1"
    ip_to        = "192.168.3.100"
    region_code  = "05"
  }
}
```

---

##  Module: `dynatrace_rum_overload_prevention`

### Description

Controls overload prevention by setting a limit threshold.

### Variables

```hcl
variable "rum_overload_prevention" {
  type = map(object({
    overload_prevention_limit = number
  }))
  description = "Sets thresholds to prevent RUM overload."
}
```

#### Example

```hcl
rum_overload_prevention = {
  rop1 = {
    overload_prevention_limit = 4000
  }
}
```

---

##  Module: `dynatrace_rum_provider_breakdown`

### Description

Configures third-party resource monitoring for RUM including domain matching.

### Variables

```hcl
variable "rum_provider_breakdown" {
  type = map(object({
    report_public_improvement = bool
    resource_name             = string
    resource_type             = string
    domain_name_pattern_list  = list(object({
      domain_name_pattern = list(object({
        pattern = string
      }))
    }))
  }))
  description = "Reports RUM data for third-party resources and public improvement options."
}
```

#### Example

```hcl
rum_provider_breakdown = {
  rpb1 = {
    report_public_improvement = false
    resource_name             = "example"
    resource_type             = "ThirdParty"
    domain_name_pattern_list = [
      {
        domain_name_pattern = [
          { pattern = "Terraform3rdPartyExample.com" }
        ]
      }
    ]
  }
}
```

---

##  Module: `dynatrace_usability_analytics`

### Description

Enables features like rage-click detection for session behavior analysis.

### Variables

```hcl
variable "usability_analytics" {
  type = map(object({
    detect_rage_clicks = bool
    application_id     = optional(string)
  }))
  description = "Enables features like rage-click detection for user analytics."
}
```

#### Example

```hcl
usability_analytics = {
  ua1 = {
    detect_rage_clicks = true
  }
  ua2 = {
    detect_rage_clicks = false
    application_id     = "APPLICATION-XXXX"
  }
}
```

---

##  Module: `dynatrace_user_action_metrics`

### Description

Defines custom metrics for user actions including filtering and dimension grouping.

### Variables

```hcl
variable "user_action_metrics" {
  type = map(object({
    enabled    = bool
    dimensions = list(string)
    metric_key = string
    filters    = list(object({
      filter = list(object({
        field_name = string
        operator   = string
        value      = string
      }))
    }))
    value = object({
      type = string
    })
  }))
  description = "Custom user action metrics definitions for analysis and monitoring."
}
```

#### Example

```hcl
user_action_metrics = {
  uam1 = {
    enabled    = true
    dimensions = ["application"]
    metric_key = "uacm.TerraformTest"
    filters = [
      {
        filter = [
          {
            field_name = "type"
            operator   = "EQUALS"
            value      = "Xhr"
          }
        ]
      }
    ]
    value = {
      type = "COUNTER"
    }
  }
}
```

---

##  Module: `dynatrace_user_experience_score`

### Description

Defines parameters for calculating Dynatrace user experience scores.

### Variables

```hcl
variable "user_experience_score" {
  type = map(object({
    consider_last_action                   = bool
    consider_rage_click                    = bool
    max_frustrated_user_actions_threshold = number
    min_satisfied_user_actions_threshold  = number
  }))
  description = "Defines thresholds and conditions to compute user experience scores."
}
```

#### Example

```hcl
user_experience_score = {
  ues1 = {
    consider_last_action                   = false
    consider_rage_click                    = false
    max_frustrated_user_actions_threshold = 20
    min_satisfied_user_actions_threshold  = 60
  }
}
```

---

##  Module: `dynatrace_user_session_metrics`

### Description

Creates custom metrics based on user session behaviors and actions.

### Variables

```hcl
variable "user_session_metrics" {
  type = map(object({
    enabled    = bool
    metric_key = string
    filters    = list(object({
      filter = list(object({
        field_name = string
        operator   = string
        value      = string
      }))
    }))
    value = object({
      type = string
    })
  }))
  description = "Defines custom user session metrics for traffic and behavior analysis."
}
```

#### Example

```hcl
user_session_metrics = {
  usm1 = {
    enabled    = false
    metric_key = "uscm.TerraformTest"
    filters = [
      {
        filter = [
          {
            field_name = "useraction.application"
            operator   = "EQUALS"
            value      = "www.terraform.io/"
          },
          {
            field_name = "useraction.name"
            operator   = "EQUALS"
            value      = "Loading of page /"
          }
        ]
      }
    ]
    value = {
      type = "COUNTER"
    }
  }
}
```
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
---

##  Notes

* **Security:** No secrets are included in variables or examples.
* **Modularity:** Each module can be reused independently or together.
* **Documentation:** Each module is documented to provide clarity for users comparing variables and logic in the Terraform code.

For more advanced use cases or troubleshooting tips, consult the [Dynatrace Terraform Provider documentation](https://registry.terraform.io/providers/dynatrace-oss/dynatrace/latest/docs).
