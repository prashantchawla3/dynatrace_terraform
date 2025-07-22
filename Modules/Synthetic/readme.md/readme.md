
#  Dynatrace Synthetic Monitoring Terraform Module

This Terraform module provisions and manages various Dynatrace Synthetic Monitoring components including:

* **Calculated Synthetic Metrics**
* **Synthetic Availability**
* **Custom Synthetic Locations**

The module is designed to be configurable and easy to integrate into existing infrastructure-as-code setups. Feature toggles allow you to enable/disable each resource independently.

---

##  Resources Overview

### 1. `dynatrace_calculated_synthetic_metric`

This resource allows you to define **custom metrics** derived from synthetic monitors. These calculated metrics are based on existing metric data (e.g., response times) and scoped to a particular monitor.

**Use case:** You can define your own threshold logic to alert if a synthetic monitor’s response time exceeds a custom value.

---

### 2. `dynatrace_synthetic_availability`

This resource configures **availability rules** that govern how Dynatrace calculates the availability of synthetic monitors. You can choose to **exclude maintenance windows** from availability reporting to avoid skewed results.

**Use case:** Prevent downtime during planned maintenance from affecting your synthetic monitor availability reports.

---

### 3. `dynatrace_synthetic_location`

This resource creates a **custom synthetic location** (either public or private) used for running synthetic monitors. This can be useful for geo-specific synthetic monitoring.

**Use case:** Deploy a synthetic agent in a specific city to test service availability and response times from that location.

---

## Inputs (Variables)

Below are all input variables used in the module with detailed explanations.

---

###  `Calculated Synthetic Metric`

| Variable                                         | Description                                                    | Type     | Example                                   | Default                                   |
| ------------------------------------------------ | -------------------------------------------------------------- | -------- | ----------------------------------------- | ----------------------------------------- |
| `enable_calculated_synthetic_metric`             | Toggle to create the calculated metric resource.               | `bool`   | `true`                                    | `true`                                    |
| `calculated_synthetic_metric_name`               | Unique display name for the custom metric.                     | `string` | `"SyntheticMetric:ResponseTimeThreshold"` | `"SyntheticMetric:ResponseTimeThreshold"` |
| `calculated_synthetic_metric_enabled`            | Whether the metric is enabled.                                 | `bool`   | `true`                                    | `true`                                    |
| `calculated_synthetic_metric_metric`             | The base metric to derive the calculated metric from.          | `string` | `"builtin:synmon.response.time"`          | `"builtin:synmon.response.time"`          |
| `calculated_synthetic_metric_metric_key`         | Unique identifier for the calculated metric (used internally). | `string` | `"calc:synthetic.browser.example_metric"` | `"calc.synthetic.response.threshold"`     |
| `calculated_synthetic_metric_monitor_identifier` | Identifier or tag of the monitor this metric applies to.       | `string` | `"SYNTHETIC_TEST-147CFF44DDB25C05"`       | `"SYNTH_MONITOR_WEB_AFRICA"`              |

---

###  `Synthetic Availability`

| Variable                                             | Description                                                          | Type   | Example | Default |
| ---------------------------------------------------- | -------------------------------------------------------------------- | ------ | ------- | ------- |
| `enable_synthetic_availability`                      | Toggle to create availability rules.                                 | `bool` | `true`  | `true`  |
| `synthetic_availability_exclude_maintenance_windows` | Whether to ignore maintenance windows when calculating availability. | `bool` | `true`  | `false` |

---

###  `Synthetic Location`

| Variable                                                   | Description                                 | Type     | Example                   | Default              |
| ---------------------------------------------------------- | ------------------------------------------- | -------- | ------------------------- | -------------------- |
| `enable_synthetic_location`                                | Toggle to create a synthetic location.      | `bool`   | `true`                    | `true`               |
| `synthetic_location_name`                                  | Name of the synthetic location.             | `string` | `"example_location"`      | `"Private Location"` |
| `synthetic_location_auto_update_chromium`                  | Allow the agent to auto-update Chromium.    | `bool`   | `true`                    | `true`               |
| `synthetic_location_availability_location_outage`          | Enable outage reporting at location level.  | `bool`   | `true`                    | `true`               |
| `synthetic_location_availability_node_outage`              | Enable node-level outage alerts.            | `bool`   | `true`                    | `false`              |
| `synthetic_location_availability_notifications_enabled`    | Enable notifications for outages.           | `bool`   | `true`                    | `true`               |
| `synthetic_location_city`                                  | City where the synthetic agent is deployed. | `string` | `"San Francisco de Asis"` | `"Nairobi"`          |
| `synthetic_location_country_code`                          | Country code (ISO 3166 format).             | `string` | `"VE"`                    | `"KE"`               |
| `synthetic_location_deployment_type`                       | Deployment type (`PRIVATE` or `PUBLIC`).    | `string` | `"STANDARD"`              | `"PRIVATE"`          |
| `synthetic_location_latitude`                              | Latitude coordinate of the location.        | `number` | `10.0758`                 | `-1.2921`            |
| `synthetic_location_longitude`                             | Longitude coordinate of the location.       | `number` | `-67.5442`                | `36.8219`            |
| `synthetic_location_location_node_outage_delay_in_minutes` | Delay before marking a node as down.        | `number` | `3`                       | `5`                  |
| `synthetic_location_region_code`                           | Custom label used to group locations.       | `string` | `"04"`                    | `"AF-EA"`            |

---

## Example Usage

```hcl
module "synthetic_monitoring" {
  source = "./modules/dynatrace-synthetic"

  enable_calculated_synthetic_metric            = true
  calculated_synthetic_metric_name              = "example_metric"
  calculated_synthetic_metric_enabled           = true
  calculated_synthetic_metric_metric            = "ResourceCount"
  calculated_synthetic_metric_metric_key        = "calc:synthetic.browser.example_metric"
  calculated_synthetic_metric_monitor_identifier = "SYNTHETIC_TEST-147CFF44DDB25C05"

  enable_synthetic_availability                 = true
  synthetic_availability_exclude_maintenance_windows = true

  enable_synthetic_location                     = true
  synthetic_location_name                       = "example_location"
  synthetic_location_city                       = "San Francisco de Asis"
  synthetic_location_country_code               = "VE"
  synthetic_location_deployment_type            = "STANDARD"
  synthetic_location_latitude                   = 10.0758
  synthetic_location_longitude                  = -67.5442
  synthetic_location_location_node_outage_delay_in_minutes = 3
  synthetic_location_region_code                = "04"
}
```

---

##  Outputs

| Output                           | Description                           |
| -------------------------------- | ------------------------------------- |
| `calculated_synthetic_metric_id` | ID of the calculated synthetic metric |
| `synthetic_availability_id`      | ID of the synthetic availability rule |
| `synthetic_location_id`          | ID of the synthetic location created  |

---

##  Notes

* **No secrets or credentials** are required by this module.
* Variables use safe default values and all identifiers like monitor IDs should be created or retrieved externally (e.g., from existing synthetic monitors).
* This module uses Terraform `count` and `for_each` to ensure flexible toggling of individual resources.

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