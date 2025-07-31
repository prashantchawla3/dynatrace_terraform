# Dynatrace Terraform Modularization Effort

This documentation outlines the modularization of Dynatrace resources using Terraform. The effort covered:

- **56 main modules**
- **320 submodules**, representing **320 individual Dynatrace resources**
- **1280 `.tf` files** created for submodules (`main.tf`, `variables.tf`, `outputs.tf`, `provider.tf`)
- **280 additional files** including:
  - `tfvars` files for submodules
  - Main modules calling submodules
  - Variables for submodules
  - Provider configurations
  - Outputs

---

## 1. Terraform Resource Module Specific Initial Configuration Setup

| Sub-Task | Description | Avg. Time (Minutes) |
|----------|-------------|---------------------|
| Understand Resource Configuration | Involved reading the Terraform documentation or official Dynatrace provider docs to grasp the structure, purpose, and behavior of each resource. Required understanding resource lifecycles, dependencies, and potential side effects of misconfiguration. distinguish mandatory configurations from optional enhancements. Misclassifying a field could result in failed plans or silent misbehavior in deployed resources. | 10 |





## 2. Development of Initial Main Terraform Module for the Dynatrace Resource

| Task | Description | Avg. Time (Minutes) |
|------|-------------|---------------------|
| Create Main Terraform Modules | Creating main terraform modules based on Terraform registry documentation: Involved using existing documentation to develop a functional module. Included trial and error for field naming, formatting, and compliance with provider expectations. Required pinpointing the exact set of variables and parameters necessary for a successful `terraform apply`.  | 15 |

###  Initial Static Version of Dynatrace Maintenance Resource

Before modularization and dynamic blocks, the resource was implemented in a static form like this:

```hcl
resource "dynatrace_maintenance" "example" {
  enabled = var.maintenance_enabled

  general_properties {
    name              = var.maintenance_name
    description       = var.maintenance_description
    type              = var.maintenance_type
    disable_synthetic = var.maintenance_disable_synthetic
    suppression       = var.maintenance_suppression
  }

  schedule {
    type = var.maintenance_schedule_type

    weekly_recurrence {
      day_of_week = var.maintenance_weekly_day_of_week

      recurrence_range {
        end_date   = var.maintenance_weekly_end_date
        start_date = var.maintenance_weekly_start_date
      }

      time_window {
        end_time   = var.maintenance_weekly_end_time
        start_time = var.maintenance_weekly_start_time
        time_zone  = var.maintenance_weekly_time_zone
      }
    }
  }
}
```

This version required explicit declaration of every nested block and field, making it rigid and harder to reuse across environments. It was later refactored using dynamic blocks to support flexible configurations.



## 3. Breaking Down Main Module into Dynamic Sub-Modules

| Task | Description | Avg. Time (Minutes) |
|------|-------------|---------------------|
| Convert to Standalone Modules | Each resource was converted into a standalone module: Modularization allowed for reuse, abstraction, and isolated testing. This process included separating logic into `main.tf`, `variables.tf`, `provider.tf`, and `outputs.tf`. | 3 |
| Implement Dynamic Blocks | Dynamic blocks (e.g., `filter_config`): Required handling optional and repeatable values using Terraform’s dynamic block syntax. This step was complex as it needed robust conditional logic and error handling. | 10 |
| Define Variables | Optional and required variables: Involved mapping Terraform schema to configurable variables, setting defaults, and documenting usage in descriptions. | 5 |

###  Implement Dynamic Blocks



**Maintenance Module:**
```hcl
dynamic "filter" {
  for_each = var.filters
  content {
    entity_type  = filter.value.entity_type
    entity_tags  = filter.value.entity_tags
  }
}
```

---

###  Define Variables


**Maintenance Module Variables:**
```hcl
variable "filters" {
  description = "List of filters for the maintenance window"
  type = list(object({
    entity_type = string
    entity_tags = list(string)
  }))
  default = [
    {
      entity_type = "SERVICE"
      entity_tags = ["Environment:Production"]
    }
  ]
}
```

---

## 4. Each Module Had to Be Individually Tested

| Task | Description | Avg. Time (Minutes) |
|------|-------------|---------------------|
| Run `terraform plan` | Run terraform plan for each module: `terraform plan --var-file=<tfvars file path>` was used to verify syntax, variable injection, and configuration correctness. | 15 |
| Retest After Changes | Re-running terraform plan: Ensured changes didn’t break configurations and newly added values were correctly interpreted. | 2 |
| Apply in Test Environment | Sometimes `terraform apply` was run in a test Dynatrace environment when plan results weren’t enough to confirm behavior. | 10 |
| Verify Outputs | Verifying outputs and resource creation: Ensured that outputs reflected expected results, such as correctly formatted IDs, names, and links between modules. | 2 |

**Example:**
```hcl
output "maintenance_id" {
  value       = dynatrace_maintenance.this.id
  description = "ID of the Dynatrace maintenance window"
}
```

---

## Summary

This modularization process significantly improves maintainability, reusability, and scalability of Dynatrace infrastructure as code.

