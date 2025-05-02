# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing various Dynatrace resources, including AIX extensions, crash dump analytics, disk analytics, eBPF service discovery, host monitoring, and more. The module is designed to simplify the configuration and management of these functionalities using Terraform.

## Table of Contents
- Introduction
- Requirements
- Providers
- Resources
- Inputs
- Outputs
- Usage

## Requirements
- Terraform >= 0.12
- Dynatrace account

## Providers
The module requires the following provider:
```hcl
terraform {
  required_providers {
    dynatrace = {
      source  = "dynatrace-oss/dynatrace"
      version = "~> 1.0"
    }
  }
}
```

## Resources
The following resources are created by this module:
- `dynatrace_aix_extension`
- `dynatrace_crashdump_analytics`
- `dynatrace_disk_analytics`
- `dynatrace_ebpf_service_discovery`
- `dynatrace_host_monitoring`
- `dynatrace_host_monitoring_advanced`
- `dynatrace_host_monitoring_mode`
- `dynatrace_host_naming`
- `dynatrace_host_process_group_monitoring`
- `dynatrace_nettracer`
- `dynatrace_network_traffic`
- `dynatrace_os_services`
- `dynatrace_host_naming_order`

## Inputs
### AIX Extension Variables
| Name                | Description                       | Type    | Default                  |
|---------------------|-----------------------------------|---------|--------------------------|
| `host_id`           | The ID of the host                | `string`| `"HOST-1234567890000000"`|
| `use_global_settings` | Use global settings             | `bool`  | `false`                  |
| `enabled`           | Enable or disable the setting     | `bool`  | `true`                   |

### Crash Dump Analytics Variables
| Name                        | Description                       | Type    | Default                  |
|-----------------------------|-----------------------------------|---------|--------------------------|
| `host_id`                   | The ID of the host                | `string`| `"HOST-1234567890000000"`|
| `enable_crash_dump_analytics` | Enable crash dump analytics     | `bool`  | `true`                   |

### Disk Analytics Variables
| Name                | Description                       | Type    | Default                  |
|---------------------|-----------------------------------|---------|--------------------------|
| `enabled`           | Enable or disable the setting     | `bool`  | `true`                   |
| `scope`             | The scope of the setting          | `string`| `"HOST-1234567890000000"`|

### eBPF Service Discovery Variables
| Name                | Description                       | Type    | Default                  |
|---------------------|-----------------------------------|---------|--------------------------|
| `ebpf`              | Enable or disable eBPF service discovery | `bool`  | `true`                   |
| `scope`             | The scope of the setting          | `string`| `"environment"`          |

### Host Monitoring Variables
| Name                | Description                       | Type    | Default                  |
|---------------------|-----------------------------------|---------|--------------------------|
| `enabled`           | Enable or disable the setting     | `bool`  | `true`                   |
| `host_id`           | The ID of the host                | `string`| `"HOST-1234567890000000"`|

### Host Monitoring Advanced Variables
| Name                | Description                       | Type    | Default                  |
|---------------------|-----------------------------------|---------|--------------------------|
| `host_id`           | The ID of the host                | `string`| `"HOST-1234567890000000"`|
| `process_agent_injection` | Process agent injection     | `bool`  | `true`                   |
| `code_module_injection`   | Code module injection       | `bool`  | `true`                   |

### Host Monitoring Mode Variables
| Name                | Description                       | Type    | Default                  |
|---------------------|-----------------------------------|---------|--------------------------|
| `host_id_mode`      | Host ID for monitoring mode       | `string`| `"HOST-E532D48B0DBD5A6B"`|
| `monitoring_mode`   | Monitoring mode                   | `string`| `"FULL_STACK"`           |

### Host Naming Variables
| Name                | Description                       | Type    | Default                  |
|---------------------|-----------------------------------|---------|--------------------------|
| `enabled`           | Enable or disable the setting     | `bool`  | `true`                   |
| `format`            | Format for naming rule            | `string`| `"{Host:DetectedName}"`  |
| `name`              | Name of the rule                  | `string`| `"example_rule"`         |

### Host Process Group Monitoring Variables
| Name                | Description                       | Type    | Default                  |
|---------------------|-----------------------------------|---------|--------------------------|
| `host_id`           | The ID of the host                | `string`| `"HOST-1234567890000000"`|
| `monitoring_state`  | Monitoring state                  | `string`| `"MONITORING_ON"`        |
| `process_group`     | Process group                     | `string`| `"PROCESS_GROUP-1234567890000000"`|

### NetTracer Variables
| Name                | Description                       | Type    | Default                  |
|---------------------|-----------------------------------|---------|--------------------------|
| `scope`             | The scope of the setting          | `string`| `"HOST-1234567890000000"`|
| `net_tracer`        | Enable or disable NetTracer       | `bool`  | `true`                   |

### Network Traffic Variables
| Name                | Description                       | Type    | Default                  |
|---------------------|-----------------------------------|---------|--------------------------|
| `host_id`           | The ID of the host                | `string`| `"HOST-1234567890000000"`|
| `ip_address`        | IP address to exclude             | `string`| `"192.168.0.1"`          |
| `interface`         | Network interface to exclude      | `string`| `"terraform_test"`       |
| `os`                | Operating system type             | `string`| `"OS_TYPE_WINDOWS"`      |

### OS Services Variables
| Name                | Description                       | Type    | Default                  |
|---------------------|-----------------------------------|---------|--------------------------|
| `name`              | Name of the service               | `string`| `"example_service"`      |
| `enabled`           | Enable or disable the setting     | `bool`  | `true`                   |
| `alert_activation_duration` | Duration before alert activation | `number` | `5`                  |
| `alerting`          | Enable or disable alerting        | `bool`  | `true`                   |
| `monitoring`        | Enable or disable monitoring      | `bool`  | `true`                   |
| `not_installed_alerting` | Alert if service is not installed | `bool`  | `true`               |
| `scope`             | The scope of the setting          | `string`| `"HOST-1234567890000000"`|
| `status_condition_linux` | Status condition for Linux services | `string` | `"$eq(failed)"`    |
| `system`            | System type                       | `string`| `"LINUX"`                |
| `condition`         | Condition for detection           | `string`| `"$contains(Terraform)"`|
| `property`          | Property for detection            | `string`| `"ServiceName"`          |
| `metadata_key`      | Metadata key                      | `string`| `"TerraformKey"`         |
| `metadata_value`    | Metadata value                    | `string`| `"TerraformValue"`       |

### Host Naming Order Variables
| Name                | Description                       | Type    | Default                  |
|---------------------|-----------------------------------|---------|--------------------------|
| `naming_rule_ids`   | IDs of the naming rules           | `list(string)` | `["dynatrace_host_naming.example.id"]` |

## Outputs
| Name                                | Description                       |
|-------------------------------------|-----------------------------------|
| `dynatrace_aix_extension_id`        | ID of the Dynatrace AIX extension |
| `dynatrace_crashdump_analytics_id`  | ID of the Dynatrace crash dump analytics |
| `dynatrace_disk_analytics_id`       | ID of the Dynatrace disk analytics |
| `dynatrace_ebpf_service_discovery_id` | ID of the Dynatrace eBPF service discovery |
| `dynatrace_host_monitoring_id`      | ID of the Dynatrace host monitoring |
| `dynatrace_host_monitoring_advanced_id` | ID of the Dynatrace host monitoring advanced |
| `dynatrace_host_monitoring_mode_id` | ID of the Dynatrace host monitoring mode |
| `dynatrace_host_naming_id`          | ID of the Dynatrace host naming |
| `dynatrace_host_process_group_monitoring_id` | ID of the Dynatrace host process group monitoring |
| `dynatrace_nettracer_id`            | ID of the Dynatrace NetTracer |
| `dynatrace_network_traffic_id`      | ID of the Dynatrace network



### API Token Scopes
To manage Dynatrace resources, your API token needs the following scopes:
- **Read settings** (`settings.read`)
- **Write settings** (`settings.write`)

Additionally, for configuration tasks:
- **Read configuration** (`ReadConfig`)
- **Write configuration** (`WriteConfig`)

### Monitoring Mode for Agents
- Changing the monitoring mode for agents that are not connected to Dynatrace is not possible.
- The Terraform Provider will ignore settings for offline hosts by default.
- To receive warnings about the inability to change the monitoring mode for offline hosts, set the environment variable `DYNATRACE_HOST_MONITORING_WARNINGS` to `true`.

