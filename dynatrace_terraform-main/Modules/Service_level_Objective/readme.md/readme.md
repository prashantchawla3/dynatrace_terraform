
# Dynatrace SLO v2 Terraform Module

This Terraform module provisions a **Service-Level Objective (SLO)** in Dynatrace using the `dynatrace_slo_v2` resource. It includes support for burn rate visualization and custom metric evaluation.

---

##  Module Features

*  Create Dynatrace SLOs with flexible metric expressions.
* Supports error budget burn rate visualization.
*  Supports STATIC and SLIDING evaluation types.
*  Filters based on service tags or types.

---

##  Module Structure

```hcl
module "slo_module" {
  source = "./modules/dynatrace_slo_v2"
  count  = var.slo_enabled ? 1 : 0

  slo_name                         = var.slo_name
  slo_description                  = var.slo_description
  slo_evaluation_type              = var.slo_evaluation_type
  slo_evaluation_window            = var.slo_evaluation_window
  slo_filter                       = var.slo_filter
  slo_metric_expression            = var.slo_metric_expression
  slo_metric_name                  = var.slo_metric_name
  slo_target_success               = var.slo_target_success
  slo_target_warning               = var.slo_target_warning
  slo_legacy_id                    = var.slo_legacy_id
  burn_rate_visualization_enabled = var.burn_rate_visualization_enabled
  fast_burn_threshold              = var.fast_burn_threshold
}
```

---

## Input Variables

| Name                              | Type   | Default Value                                                  | Description                          |
| --------------------------------- | ------ | -------------------------------------------------------------- | ------------------------------------ |
| `slo_name`                        | string | `"Availability SLO"`                                           | Logical name of the SLO.             |
| `slo_enabled`                     | bool   | `true`                                                         | Toggle SLO provisioning.             |
| `slo_description`                 | string | `"Tracks availability of key services based on error rate..."` | Human-readable description.          |
| `slo_evaluation_type`             | string | `"STATIC"`                                                     | Evaluation type (STATIC or SLIDING). |
| `slo_evaluation_window`           | string | `"LAST_7_DAYS"`                                                | Time window for evaluation.          |
| `slo_filter`                      | string | `"type(SERVICE),tag([Team:Platform])"`                         | Entity selector filter.              |
| `slo_metric_expression`           | string | `"(100 - builtin:service.errors.total.count:splitBy())"`       | Metric expression.                   |
| `slo_metric_name`                 | string | `"synthetic_success_rate"`                                     | Name of metric.                      |
| `slo_target_success`              | number | `99.95`                                                        | Target threshold %.                  |
| `slo_target_warning`              | number | `99.0`                                                         | Warning threshold %.                 |
| `slo_legacy_id`                   | string | `"slo-platform-core"`                                          | Optional legacy ID.                  |
| `burn_rate_visualization_enabled` | bool   | `true`                                                         | Enable burn rate charts.             |
| `fast_burn_threshold`             | number | `null`                                                         | Burn rate threshold (optional).      |

---

## Outputs

| Name       | Description             |
| ---------- | ----------------------- |
| `slo_id`   | ID of the created SLO   |
| `slo_name` | Name of the created SLO |

---

##  Sample `sample.tfvars`

```hcl
slo_name                         = "Your SLO Name"
slo_enabled                      = true
slo_description                  = "Description of your SLO"
slo_evaluation_type              = "STATIC"
slo_evaluation_window            = "LAST_7_DAYS"
slo_filter                       = "type(SERVICE),tag([Team:Platform])"
slo_metric_expression            = "(100 - builtin:service.errors.total.count:splitBy())"
slo_metric_name                  = "synthetic_success_rate"
slo_target_success               = 99.9
slo_target_warning               = 95.0
slo_legacy_id                    = "your-slo-id"
burn_rate_visualization_enabled = true
fast_burn_threshold              = 0.5
```

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

##  Requirements

* Terraform v1.0+
* Dynatrace Provider (properly configured with API token)
* A valid Dynatrace environment

---

##  Notes

* `burn_rate_visualization_enabled` will conditionally render the `error_budget_burn_rate` block.
* To disable burn rate threshold, set `fast_burn_threshold = null`.

---
