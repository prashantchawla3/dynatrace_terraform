
#  Dynatrace Custom Device Module

This Terraform module provisions a Dynatrace **custom device**, allowing you to define synthetic infrastructure components (like routers, switches, gateways) that aren't automatically discovered. These custom devices can be enriched with metadata, tags, IP addresses, DNS entries, port exposure, and group classifications.


##  What Does This Module Do?

This module creates a synthetic device in Dynatrace using the `dynatrace_custom_device` resource.

###  Resource Behavior

Each module block configures a specific part of the custom device's metadata:

| Module Block        | Purpose                                                              |
|---------------------|----------------------------------------------------------------------|
| `custom_device_id`  | Unique identifier for the device                                      |
| `display_name`      | UI-facing label of the device                                         |
| `config_url`        | External link or metadata URL for configuration details              |
| `dns_names`         | DNS names associated with the device                                  |
| `favicon_url`       | Icon image representing the device in the Dynatrace UI               |
| `group`             | Logical group for organizational hierarchy (e.g., `synthetic-network`)|
| `ip_addresses`      | List of IP addresses mapped to this device                            |
| `listen_ports`      | Port exposure for traffic monitoring or mapping                      |
| `props`             | Custom properties for device metadata                                |
| `type`              | Device classification used for filtering or labeling                 |
| `ui_based`          | Declares if device was manually created via the UI                   |

---

##  Input Variables & Examples

| Variable | Type | Description | Default |
|---------|------|-------------|---------|
| `custom_device_id` | `string` | Unique reference ID for the device. This is used internally by Dynatrace to associate logs and metrics. | `"custom-device-01"` |
| `display_name` | `string` | The human-readable name shown in Dynatrace. Useful for dashboards and search. | `"Synthetic Router"` |
| `config_url` | `string` | External-facing URL containing device metadata or monitoring config. | `"https://config.devices.local/router01"` |
| `dns_names` | `list(string)` | DNS names linked to the device. These enhance discoverability and correlate monitoring data. | `["router01.local", "synthetic-router.internal"]` |
| `favicon_url` | `string` | Icon used in UI for the device. Can be a local SVG or PNG image path. | `"https://cdn.icons.local/router.svg"` |
| `group` | `string` | Logical group for device (e.g., `synthetic-network`, `virtual-router`). Grouping improves filtering and tagging. | `"synthetic-network"` |
| `ip_addresses` | `list(string)` | List of IPs bound to the device. Useful for alerting and network visibility. | `["10.0.0.1", "10.0.0.2"]` |
| `listen_ports` | `list(number)` | Ports the device is listening on. Used by Dynatrace to map traffic and endpoints. | `[80, 443, 8443]` |
| `props` | `string` | Optional string of custom key=value properties joined with `;`. Used for filtering, tagging, and observability. | `"location=DC1;role=router"` |
| `type` | `string` | Classification label (e.g., `synthetic-router`, `firewall`). Used in Dynatrace UI views. | `"synthetic-router"` |
| `ui_based` | `bool` | Set to `true` if created manually in Dynatrace UI. Otherwise leave as `false` for Terraform-driven creation. | `false` |

---

##  Example Usage

```hcl
module "custom_device_id" {
  source           = "./modules/dynatrace_custom_device"
  custom_device_id = "custom-device-01"
}

module "display_name" {
  source       = "./modules/dynatrace_custom_device"
  display_name = "Synthetic Router"
}

module "ip_addresses" {
  source       = "./modules/dynatrace_custom_device"
  ip_addresses = ["10.0.0.1", "10.0.0.2"]
}

module "group" {
  source = "./modules/dynatrace_custom_device"
  group  = "synthetic-network"
}
```


---

##  Outputs

| Output                    | Description                                                  |
|---------------------------|--------------------------------------------------------------|
| `custom_device_entity_id` | The generated entity ID used by Dynatrace to reference the device |
| `custom_device_id`        | The Terraform resource ID of the created custom device       |

---

##  Module Scope

This module is ideal for use cases such as:

- Creating synthetic representations of infrastructure devices
- Visualizing custom endpoints in Dynatrace
- Tagging, grouping, and surfacing device metadata dynamically

---

