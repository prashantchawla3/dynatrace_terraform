

## `dynatrace_golden_state`

>  **Warning**:  
> This resource is currently **experimental** and **disabled by default**.  
> To gain early access, you must request it via a GitHub ticket.  
> **Dynatrace Support will not assist** with this resource at this time.  
>  
> Additionally, this resource **does not represent an actual setting** in the Dynatrace environment or cluster. It is used to **detect and optionally delete** resources not managed by Terraform.

### Required API Token Scopes
- `settings.read`
- `settings.write`

---

### How to Determine tfvars Values

- **`mode`**: Set to `"WARN"` (default) to log unmanaged resources, or `"DELETE"` to automatically remove them.
- **`dynatrace_management_zone_v2`**: List of IDs for management zones that are managed by Terraform.
- **`dynatrace_alerting`**: List of alerting profile IDs managed by Terraform.
- **`dynatrace_autotag_v2`**: List of auto tag IDs managed by Terraform.

These values should reflect the **Terraform-managed state**. Any existing resources in Dynatrace not listed here will be flagged or deleted depending on the mode.

---

### Schema

#### Optional
- `mode` (String) — Determines behavior for unmanaged resources. Possible values:
  - `"WARN"`: Logs a warning for unmanaged resources (default).
  - `"DELETE"`: Deletes unmanaged resources.
- `dynatrace_management_zone_v2` (List of String) — List of Terraform-managed management zone IDs.
- `dynatrace_alerting` (List of String) — List of Terraform-managed alerting profile IDs.
- `dynatrace_autotag_v2` (List of String) — List of Terraform-managed auto tag IDs.

#### Read-Only
- `id` (String) — The ID of this resource.

---

### Supported Resource Types

The following resource types are currently supported by `dynatrace_golden_state`:

- `dynatrace_management_zone_v2`
- `dynatrace_alerting`
- `dynatrace_autotag_v2`
- `dynatrace_request_attribute`
- `dynatrace_queue_manager`
- `dynatrace_ims_bridges`
- `dynatrace_custom_service`
- `dynatrace_aws_credentials`
- `dynatrace_azure_credentials`
- `dynatrace_span_capture_rule`
- `dynatrace_span_context_propagation`
- `dynatrace_slo_v2`
- `dynatrace_web_application`
- `dynatrace_mobile_application`
- `dynatrace_jira_notification`
- `dynatrace_webhook_notification`
- `dynatrace_ansible_tower_notification`
- `dynatrace_email_notification`
- `dynatrace_ops_genie_notification`
- `dynatrace_pager_duty_notification`
- `dynatrace_service_now_notification`
- `dynatrace_slack_notification`
- `dynatrace_trello_notification`
- `dynatrace_victor_ops_notification`
- `dynatrace_xmatters_notification`
- `dynatrace_maintenance`
- `dynatrace_metric_events`
- `dynatrace_key_requests`
- `dynatrace_credentials`
- `dynatrace_calculated_service_metric`
- `dynatrace_calculated_web_metric`
- `dynatrace_calculated_mobile_metric`
- `dynatrace_http_monitor`
- `dynatrace_browser_monitor`
- `dynatrace_calculated_synthetic_metric`
- `dynatrace_host_naming`
- `dynatrace_processgroup_naming`
- `dynatrace_service_naming`
- `dynatrace_request_naming`
- `dynatrace_application_detection_rule`
- `dynatrace_application_error_rules`
- `dynatrace_synthetic_location`
- `dynatrace_queue_sharing_groups`
- `dynatrace_pg_alerting`
- `dynatrace_database_anomalies_v2`
- `dynatrace_process_monitoring_rule`
- `dynatrace_disk_anomalies_v2`
- `dynatrace_disk_specific_anomalies_v2`
- `dynatrace_host_anomalies_v2`
- `dynatrace_custom_app_anomalies`
- `dynatrace_custom_app_crash_rate`
- `dynatrace_process_monitoring`
- `dynatrace_process_availability`
- `dynatrace_process_group_detection`
- `dynatrace_mobile_app_anomalies`
- `dynatrace_mobile_app_crash_rate`
- `dynatrace_web_app_anomalies`
- `dynatrace_muted_requests`
- `dynatrace_declarative_grouping`
- `dynatrace_host_process_group_monitoring`
- `dynatrace_rum_ip_locations`
- `dynatrace_custom_app_enablement`
- `dynatrace_mobile_app_enablement`
- `dynatrace_web_app_enablement`
- `dynatrace_process_group_rum`
- `dynatrace_rum_provider_breakdown`
- `dynatrace_web_app_resource_cleanup`
- `dynatrace_update_windows`
- `dynatrace_process_group_detection_flags`
- `dynatrace_process_group_monitoring`
- `dynatrace_process_group_simple_detection`
- `dynatrace_log_metrics`
- `dynatrace_browser_monitor_performance`
- `dynatrace_session_replay_web_privacy`
- `dynatrace_monitored_technologies_apache`
- `dynatrace_monitored_technologies_dotnet`
- `dynatrace_monitored_technologies_go`
- `dynatrace_monitored_technologies_iis`
- `dynatrace_monitored_technologies_java`
- `dynatrace_monitored_technologies_nginx`
- `dynatrace_monitored_technologies_nodejs`
- `dynatrace_monitored_technologies_opentracing`
- `dynatrace_monitored_technologies_php`
- `dynatrace_monitored_technologies_varnish`
- `dynatrace_monitored_technologies_wsmb`
- `dynatrace_process_visibility`
- `dynatrace_oneagent_features`
- `dynatrace_rum_advanced_correlation`
- `dynatrace_web_app_beacon_origins`
- `dynatrace_web_app_resource_types`
- `dynatrace_generic_types`
- `dynatrace_data_privacy`
- `dynatrace_service_failure`
- `dynatrace_service_http_failure`
- `dynatrace_disk_options`
- `dynatrace_extension_execution_controller`
- `dynatrace_nettracer`
- `dynatrace_aix_extension`
- `dynatrace_k8s_namespace_anomalies`

---

### Data Source Usage
This resource does not support a data source block. It is used to **audit and optionally clean up** unmanaged resources in your Dynatrace environment.

---
