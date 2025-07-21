

# Dynatrace Synthetic Monitoring Resources

This README documents the Terraform resources used to configure synthetic monitoring, locations, and calculated metrics in Dynatrace.

---

## `dynatrace_calculated_synthetic_metric`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Name of the calculated metric.
- **`enabled`**: Set to `true` to enable the metric.
- **`metric`**: Base metric to calculate from (e.g., `ResourceCount`).
- **`metric_key`**: Unique key for the calculated metric.
- **`monitor_identifier`**: Identifier of the synthetic monitor.

### Schema

#### Required
- `name` (String)
- `enabled` (Boolean)
- `metric` (String)
- `metric_key` (String)
- `monitor_identifier` (String)

---

## `dynatrace_synthetic_availability`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`exclude_maintenance_windows`**: Set to `true` to exclude maintenance windows from availability calculations.

### Schema

#### Required
- `exclude_maintenance_windows` (Boolean)

---

## `dynatrace_synthetic_location`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Name of the synthetic location.
- **`auto_update_chromium`**: Enable automatic Chromium updates.
- **`availability_location_outage`**: Enable location outage detection.
- **`availability_node_outage`**: Enable node outage detection.
- **`availability_notifications_enabled`**: Enable notifications for outages.
- **`city`**: City name.
- **`country_code`**: ISO country code.
- **`deployment_type`**: Deployment type (e.g., `STANDARD`).
- **`latitude`** and **`longitude`**: Geolocation coordinates.
- **`location_node_outage_delay_in_minutes`**: Delay before node outage is reported.
- **`region_code`**: Region code.

### Schema

#### Required
- `name` (String)
- `auto_update_chromium` (Boolean)
- `availability_location_outage` (Boolean)
- `availability_node_outage` (Boolean)
- `availability_notifications_enabled` (Boolean)
- `city` (String)
- `country_code` (String)
- `deployment_type` (String)
- `latitude` (Number)
- `location_node_outage_delay_in_minutes` (Number)
- `longitude` (Number)
- `region_code` (String)

---

## Data Source Usage

These resources do not have dedicated data sources. To retrieve existing configurations, use:

```bash
terraform-provider-dynatrace -export <resource_name>
```

Replace `<resource_name>` with the specific resource you want to export.

---

