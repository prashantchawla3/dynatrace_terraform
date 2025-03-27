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
| `log_agent_scope` | The scope of this setting (HOST, KUBERNETES_CLUSTER, HOST_GROUP). Omit this property if you want to cover the whole environment. | `string` | `"HOST-1234567890000000"` |
| `new_container_log_detector` | Enable OneAgent to collect all container logs in Kubernetes environments. | `bool` | `true` |
| `journald_log_detector` | Enable OneAgent to collect logs from Journald on Linux systems. | `bool` | `false` |

### Log Buckets Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `log_buckets_enabled` | This setting is enabled (true) or disabled (false) | `bool` | `true` |
| `log_buckets_bucket_name` | A 'bucket' is the length of time your logs will be stored. Select the bucket that's best for you. | `string` | `"default_logs"` |
| `log_buckets_matcher` | Matcher (DQL) | `string` | `"matchesPhrase(content, \"error\")"` |
| `log_buckets_rule_name` | Rule name | `string` | `"example_rule"` |
| `log_buckets_insert_after` | Specify the ID of the resource instance that comes before this instance regarding order. | `string` | `null` |

### Log Custom Attribute Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `log_custom_attribute_sidebar` | Show attribute values in side bar | `bool` | `false` |
| `log_custom_attribute_key` | The attribute key is case sensitive in log data ingestion. | `string` | `"example_key"` |

### Log Custom Source Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `log_custom_source_name` | Name | `string` | `"example_custom_source"` |
| `log_custom_source_enabled` | This setting is enabled (true) or disabled (false) | `bool` | `false` |
| `log_custom_source_scope` | The scope of this setting (HOST, KUBERNETES_CLUSTER, HOST_GROUP). Omit this property if you want to cover the whole environment. | `string` | `"HOST_GROUP-1234567890000000"` |
| `log_custom_source_type` | Possible Values: LOG_PATH_PATTERN, WINDOWS_EVENT_LOG | `string` | `"WINDOWS_EVENT_LOG"` |
| `log_custom_source_path` | Values | `string` | `"/terraform"` |
| `log_custom_source_enrichment_type_1` | Possible Values: Attribute | `string` | `"attribute"` |
| `log_custom_source_enrichment_key_1` | Enrichment key 1 | `string` | `"key1"` |
| `log_custom_source_enrichment_value_1` | Enrichment value 1 | `string` | `"value1"` |
| `log_custom_source_enrichment_type_2` | Possible Values: Attribute | `string` | `"attribute"` |
| `log_custom_source_enrichment_key_2` | Enrichment key 2 | `string` | `"key2"` |
| `log_custom_source_enrichment_value_2` | Enrichment value 2 | `string` | `"value2"` |

### Log Debug Settings Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `log_debug_settings_enabled` | This setting is enabled (true) or disabled (false) | `bool` | `false` |

### Log Events Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `log_events_enabled` | This setting is enabled (true) or disabled (false) | `bool` | `false` |
| `log_events_query` | Log query | `string` | `"matchesPhrase(content, \"terratest\")"` |
| `log_events_summary` | The textual summary of the log event entry | `string` | `"Created by Terraform"` |
| `log_events_description` | The description of the event to trigger. | `string` | `"Created by Terraform"` |
| `log_events_event_type` | Possible Values: AVAILABILITY, CUSTOM_ALERT, CUSTOM_ANNOTATION, CUSTOM_CONFIGURATION, CUSTOM_DEPLOYMENT, ERROR, INFO, MARKED_FOR_TERMINATION, RESOURCE, SLOWDOWN | `string` | `"INFO"` |
| `log_events_title` | The title of the event to trigger. | `string` | `"{content}"` |
| `log_events_metadata_key_1` | Metadata key 1 | `string` | `"terraform.key"` |
| `log_events_metadata_value_1` | Metadata value 1 | `string` | `"terraform.value"` |

### Log Metrics Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `log_metrics_enabled` | This setting is enabled (true) or disabled (false) | `bool` | `true` |
| `log_metrics_dimensions` | Dimensions | `list(string)` | `["dt.os.type", "dt.entity.process_group"]` |
| `log_metrics_key` | Key | `string` | `"log.terraformexample3"` |
| `log_metrics_measure` | Measure | `string` | `"ATTRIBUTE"` |
| `log_metrics_measure_attribute` | Measure attribute | `string` | `"dt.entity.host"` |
| `log_metrics_query` | Query | `string` | `"matchesPhrase(content, \"terratest\")"` |

### Log OneAgent Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `log_oneagent_container_timezone_heuristic_enabled` | Enable OneAgent to use container timezone heuristic. | `bool` | `true` |
| `log_oneagent_containers_logs_detection_enabled` | Enable OneAgent to detect container logs. | `bool` | `true` |
| `log_oneagent_date_search_limit_bytes` | Date search limit in bytes. | `number` | `1024` |
| `log_oneagent_default_timezone` | Default timezone for OneAgent. | `string` | `"UTC"` |
| `log_oneagent_event_log_query_timeout_sec` | Event log query timeout in seconds. | `number` | `30` |
| `log_oneagent_iisdetection_enabled` | Enable IIS detection. | `bool` | `true` |
| `log_oneagent_log_scanner_linux_nfs_enabled` | Enable log scanner for Linux NFS. | `bool` | `true` |
| `log_oneagent_max_lgis_per_entity_count` | Max LGIs per entity count. | `number` | `100` |
| `log_oneagent_min_binary_detection_limit_bytes` | Min binary detection limit in bytes. | `number` | `512` |
| `log_oneagent_monitor_own_logs_enabled` | Enable monitoring of OneAgent's own logs. | `bool` | `true` |
| `log_oneagent_open_log_files_detection_enabled` | Enable detection of open log files. | `bool` | `true` |
| `log_oneagent_scope` | Scope for OneAgent settings. | `string` | `"environment"` |
| `log_oneagent_severity_detection_limit_bytes` | Severity detection limit in bytes. | `number` | `2048` |
| `log_oneagent_severity_detection_lines_limit` | Severity detection lines limit. | `number` | `100` |
| `log_oneagent_system_logs_detection_enabled` | Enable system logs detection. | `bool` | `true` |

### Log Processing Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `log_processing_enabled` | Enable log processing. | `bool` | `true` |
| `log_processing_query` | Log processing query. | `string` | `"matchesPhrase(content, \"terratest\")"` |
|