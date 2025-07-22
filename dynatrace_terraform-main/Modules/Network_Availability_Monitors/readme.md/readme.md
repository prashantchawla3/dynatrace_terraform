

#  Dynatrace Synthetic Network Monitoring Terraform Modules

This module set provisions and configures synthetic network monitors and outage thresholds within Dynatrace to continuously validate network performance and availability across multiple geographic locations.

It contains two distinct modules:

- `dynatrace_network_monitor`: Defines synthetic monitors with step-by-step actions and performance rules.
- `dynatrace_network_monitor_outage`: Configures global and location-level outage thresholds per monitor.

---

##  Module: `dynatrace_network_monitor`

###  Purpose

Deploys synthetic monitors that simulate network actions such as `PING` or HTTP checks. Each monitor can:

- Target multiple locations
- Run on a schedule (defined in `frequency_min`)
- Include validation steps (`steps`)
- Define performance thresholds
- Support tagging for filtering and ownership

###  Required Variable: `network_monitors`

A map of monitor configurations. Each key represents a monitor ID. The object defines its runtime behavior, detection parameters, and tagging.


###  Outputs

| Output Name             | Description                                |
|-------------------------|--------------------------------------------|
| `network_monitor_ids`   | Map of monitor keys to their Dynatrace IDs |
| `network_monitor_names` | Map of monitor keys to their names         |

---

##  Module: `dynatrace_network_monitor_outage`

###  Purpose

Defines outage thresholds for synthetic monitors, including:

- Global outage detection: across all monitored locations
- Local outage detection: per-location anomaly rules

###  Required Variable: `network_monitor_outages`

Map of outage configuration scoped to monitor IDs. Usually paired with monitors from `network_monitors`.


###  Output

| Output Name                         | Description                                               |
|-------------------------------------|-----------------------------------------------------------|
| `network_monitor_outage_thresholds` | Global/local outage thresholds by monitor key             |

Example output:

```hcl
{
  ping_global = {
    global = 3
    local  = 2
  }
}
```

---

##  How to Use These Modules

In your root Terraform configuration:

```hcl
module "network_monitor" {
  for_each = var.network_monitors
  source   = "./modules/dynatrace_network_monitor"
  ...
}

module "network_monitor_outage" {
  for_each = var.network_monitor_outages
  source   = "./modules/dynatrace_network_monitor_outage"
  ...
}
```

Each entry in the input maps represents a single synthetic monitor or its outage settings. These are safely modular and can be extended for dynamic infrastructure coverage.

---



