# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing various log-related resources in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

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

- `dynatrace_log_agent_feature_flags`
- `dynatrace_log_buckets`
- `dynatrace_log_custom_attribute`
- `dynatrace_log_custom_source`
- `dynatrace_log_debug_settings`
- `dynatrace_log_events`
- `dynatrace_log_metrics`
- `dynatrace_log_oneagent`
- `dynatrace_log_processing`
- `dynatrace_log_security_context`
- `dynatrace_log_sensitive_data_masking`
- `dynatrace_log_storage`
- `dynatrace_log_timestamp`

## Inputs
### Log Agent Feature Flags Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `scope` | The scope of this setting (HOST, KUBERNETES_CLUSTER, HOST_GROUP). Omit this property if you want to cover the whole environment. | `string` | `"HOST-1234567890000000"` |
| `new_container_log_detector` | Enable OneAgent to collect all container logs in Kubernetes environments. | `bool` | `true` |
| `journald_log_detector` | Enable OneAgent to collect logs from Journald on Linux systems. | `bool` | `false` |

### Log Buckets Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `enabled_buckets` | This setting is enabled (true) or disabled (false) | `bool` | `true` |
| `bucket_name` | A 'bucket' is the length of time your logs will be stored. Select the bucket that's best for you. | `string` | `"default_logs"` |
| `matcher_buckets` | Matcher (DQL) | `string` | `"matchesPhrase(content, \"error\")"` |
| `rule_name_buckets` | Rule name | `string` | `"example_rule"` |
| `insert_after_buckets` | Specify the ID of the resource instance that comes before this instance regarding order. | `string` | `null` |

### Log Custom Attribute Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `sidebar_custom_attribute` | Show attribute values in side bar | `bool` | `false` |
| `key_custom_attribute` | The attribute key is case sensitive in log data ingestion. | `string` | `"example_key"` |

### Log Custom Source Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `name_custom_source` | Name | `string` | `"example_name"` |
| `enabled_custom_source` | This setting is enabled (true) or disabled (false) | `bool` | `false` |
| `scope_custom_source` | The scope of this setting (HOST, KUBERNETES_CLUSTER, HOST_GROUP). Omit this property if you want to cover the whole environment. | `string` | `"HOST_GROUP-1234567890000000"` |
| `custom_log_source_type` | Possible Values: LOG_PATH_PATTERN, WINDOWS_EVENT_LOG | `string` | `"WINDOWS_EVENT_LOG"` |
| `custom_log_source_path` | Values | `string` | `"/terraform"` |
| `enrichment_type_custom_source` | Possible Values: Attribute | `string` | `"attribute"` |
| `enrichment_key1_custom_source` | Enrichment key 1 | `string` | `"key1"` |
| `enrichment_value1_custom_source` | Enrichment value 1 | `string` | `"value1"` |
| `enrichment_key2_custom_source` | Enrichment key 2 | `string` | `"key2"` |
| `enrichment_value2_custom_source` | Enrichment value 2 | `string` | `"value2"` |

### Log Debug Settings Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `enabled_debug_settings` | This setting is enabled (true) or disabled (false) | `bool` | `false` |

### Log Events Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `enabled_events` | This setting is enabled (true) or disabled (false) | `bool` | `false` |
| `query_events` | Log query | `string` | `"matchesPhrase(content, \"terratest\")"` |
| `summary_events` | The textual summary of the log event entry | `string` | `"Created by Terraform"` |
| `event_description` | The description of the event to trigger. | `string` | `"Created by Terraform"` |
| `event_type` | Possible Values: AVAILABILITY, CUSTOM_ALERT, CUSTOM_ANNOTATION, CUSTOM_CONFIGURATION, CUSTOM_DEPLOYMENT, ERROR, INFO, MARKED_FOR_TERMINATION, RESOURCE, SLOWDOWN | `string` | `"INFO"` |
| `event_title` | The title of the event to trigger. | `string` | `"{content}"` |
| `metadata_key` | Metadata key 1 | `string` | `"terraform.key"` |
| `metadata_value` | Metadata value 1 | `string` | `"terraform.value"` |

### Log Metrics Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `enabled_metrics` | This setting is enabled (true) or disabled (false) | `bool` | `true` |
| `dimensions_metrics` | Dimensions | `list(string)` | `["dt.os.type", "dt.entity.process_group"]` |
| `key_metrics` | Key | `string` | `"log.terraformexample3"` |
| `measure_metrics` | Measure | `string` | `"ATTRIBUTE"` |
| `measure_attribute_metrics` | Measure attribute | `string` | `"dt.entity.host"` |
| `query_metrics` | Query | `string` | `"matchesPhrase(content, \"terratest\")"` |

### Log OneAgent Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `container_timezone_heuristic_enabled` | Enable OneAgent to use container timezone heuristic. | `bool` | `true` |
| `containers_logs_detection_enabled` | Enable OneAgent to detect container logs. | `bool` | `true` |
| `date_search_limit_bytes` | Date search limit in bytes. | `number` | `64` |
| `default_timezone` | Default timezone for OneAgent. | `string` | `"Local time zone"` |
| `event_log_query_timeout_sec` | Event log query timeout in seconds. | `number` | `5` |
| `iisdetection_enabled` | Enable IIS detection. | `bool` | `true` |
| `log_scanner_linux_nfs_enabled` | Enable log scanner for Linux NFS. | `bool` | `false` |
| `max_lgis_per_entity_count` | Max LGIs per entity count. | `number` | `200` |
| `min_binary_detection_limit_bytes` | Min binary detection limit in bytes. | `number` | `512` |
| `monitor_own_logs_enabled` | Enable monitoring of OneAgent's own logs. | `bool` | `false` |
| `open_log_files_detection_enabled` | Enable detection of open log files. | `bool` | `true` |
| `scope_oneagent` | Scope for OneAgent settings. | `string` | `"environment"` |
| `severity_detection_limit_bytes` | Severity detection limit in bytes. | `number` | `100` |
| `severity_detection_lines_limit` | Severity detection lines limit. | `number` | `2` |
| `system_logs_detection_enabled` | Enable system logs detection. | `bool` | `true` |

### Log Processing Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `enabled_processing` | Enable log processing. | `bool` | `false` |
| `query_processing` | Log processing query. | `string` | `"matchesPhrase(content, \"terratest\")"` |
| `rule_name_processing` | Rule name for log processing. | `string` | `"example_rule"` |
| `processor_rule` | Processor definition rule. | `string` | `<<-EOT\n PARSE(content,\"LD 'total: ' INT:total '; failed: ' INT:failed\")\n \n FIELDS_ADD(failed.percentage: 100.0 * failed / total + '%')\n \n FIELDS_REMOVE(total, failed)\nEOT` |
| `sample_log_processing` | Sample log in JSON format for log processing. | `string`