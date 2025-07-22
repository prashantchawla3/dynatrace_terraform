
#  Dynatrace Metric Modeling Modules (Custom Units, Metadata, Queries)

This Terraform module set enables precise control and customization of metrics within Dynatrace, supporting:

-  Custom unit definitions for custom metrics
-  Metadata enrichment for metric display and organization
-  Histogram bucket ingest toggles
-  Metric selector queries

It helps you define semantic meaning, visibility, and query behavior for all observability metrics used in dashboards, SLOs, and alerts.

---

##  Module: `dynatrace_custom_units`

###  What it does
Registers a unique **custom unit** in Dynatrace (e.g., `ms`, `transactions`, `rpm`). These units standardize how metrics are displayed and interpreted.

###  Variables

| Variable                 | Description |
|--------------------------|-------------|
| `custom_units_name`      | Unique identifier for the unit (e.g., `latencyUnit`) |
| `custom_units_description` | Free-form description used for clarity in the UI |
| `custom_units_plural_name` | Plural version of the unit name for label generation |
| `custom_units_symbol`    | Unit abbreviation (e.g., `ms`, `rpm`, `ops`) |



###  Output

| Name              | Description |
|------------------|-------------|
| `custom_units_id` | Internal Dynatrace ID of the registered custom unit |

---

##  Module: `dynatrace_histogram_metrics`

###  What it does
Enables or disables ingestion of histogram bucket data. Dynatrace uses this toggle to determine whether it should retain granular histogram sample distributions.

###  Variable

| Variable | Description |
|----------|-------------|
| `histogram_metrics_enable_histogram_bucket_ingest` | Set to `true` to activate bucket ingest for histogram metrics |


###  Output

| Name                 | Description |
|---------------------|-------------|
| `histogram_metrics_id` | Resource ID for the histogram ingest toggle |

---

##  Module: `dynatrace_metric_metadata`

###  What it does
Attaches metadata to metrics, improving readability and classification in Dynatrace dashboards and explorers.

###  Variables

| Variable | Description |
|----------|-------------|
| `metric_metadata_display_name` | UI display name for the metric |
| `metric_metadata_metric_id`    | ID of the metric (e.g., `custom.latency.frontend`) |
| `metric_metadata_unit`         | Unit symbol for rendering values (`ms`, `MB`, etc) |


###  Output

| Name                 | Description |
|---------------------|-------------|
| `metric_metadata_id` | Resource ID representing the metadata assignment |

---

##  Module: `dynatrace_metric_query`

###  What it does
Constructs and registers metric queries using Dynatrace selector syntax, used for data analysis, dashboards, and calculated SLOs.

###  Variables

| Variable | Description |
|----------|-------------|
| `metric_query_metric_id`        | ID of metric to query |
| `metric_query_metric_selector`  | Selector syntax used to query values, aggregate, filter, split |


###  Output

| Name             | Description |
|------------------|-------------|
| `metric_query_id` | Resource ID for the metric query registered |

---

##  Integration Pattern

Use these modules together for full metric modeling:

```hcl
module "custom_units_symbol" {
  source            = "./modules/dynatrace_custom_units"
  custom_units_name = "latencyUnit"
  ...
}

module "metric_metadata_unit" {
  source                = "./modules/dynatrace_metric_metadata"
  metric_metadata_unit = "ms"  # refers to unit symbol above
}
```

---


##  Outputs Summary

| Output Variable         | Purpose                              |
|--------------------------|---------------------------------------|
| `custom_units_id`        | ID of registered unit                 |
| `histogram_metrics_id`   | ID for histogram ingest configuration |
| `metric_metadata_id`     | ID for attached metadata              |
| `metric_query_id`        | ID for registered metric selector     |

---

