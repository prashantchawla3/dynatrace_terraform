
zone_name        = "example_zone"
zone_description = "This is an example management zone"
zone_legacy_id   = "legacy-id-example"
entity_selector  = "type(\"HOST\")"

# Alerting Profile Variables
alerting_name                    = "example_alerting_profile"
alerting_management_zone         = "example_zone" # Reference the management zone created
alerting_rule_1_tags             = ["EnvironmentA:production", "Team:test"]
alerting_rule_1_delay_in_minutes = 0
alerting_rule_1_severity_level   = "AVAILABILITY"
alerting_rule_2_tags             = ["EnvironmentB:production", "Team:test"]
alerting_rule_2_delay_in_minutes = 0
alerting_rule_2_severity_level   = "CUSTOM_ALERT"
alerting_rule_3_tags             = ["EnvironmentC:production", "Team:test"]
alerting_rule_3_delay_in_minutes = 0
alerting_rule_3_severity_level   = "ERRORS"
alerting_rule_4_tags             = ["EnvironmentD:production", "Team:test"]
alerting_rule_4_delay_in_minutes = 0
alerting_rule_4_severity_level   = "MONITORING_UNAVAILABLE"
alerting_rule_5_tags             = ["EnvironmentE:production", "Team:test"]
alerting_rule_5_delay_in_minutes = 0
alerting_rule_5_severity_level   = "PERFORMANCE"
alerting_rule_6_tags             = ["EnvironmentF:production", "Team:test"]
alerting_rule_6_delay_in_minutes = 0
alerting_rule_6_severity_level   = "RESOURCE_CONTENTION"

# Connectivity Alerts Variables
connectivity_alerts = false
process_group_id    = "PROCESS_GROUP-1234567890000000"

# Maintenance Window Variables
maintenance_enabled            = true
maintenance_name               = "example_maintenance_window"
maintenance_description        = "Terraform test execution"
maintenance_type               = "PLANNED"
maintenance_disable_synthetic  = true
maintenance_suppression        = true
maintenance_schedule_type      = "WEEKLY"
maintenance_weekly_day_of_week = "MONDAY"
maintenance_weekly_end_date    = "2022-10-06"
maintenance_weekly_start_date  = "2022-10-05"
maintenance_weekly_end_time    = "15:13:00"
maintenance_weekly_start_time  = "14:13:00"
maintenance_weekly_time_zone   = "UTC"
maintenance_filter_entity_type = "HOST"
maintenance_filter_entity_tags = ["KeyTest:ValueTest"]

# Dashboard Variables
dashboard_name   = "Example Dashboard"
dashboard_shared = true
dashboard_owner  = "Dynatrace"
dashboard_tags   = ["Example"]
dashboard_preset = false
metric_name      = "ext:cloud.azure.microsoft_cognitiveservices.accounts.successfulcalls"

# Autotag Variables
autotag_name = "example_autotag_name"

# Additional Variables
generic_relationships_enabled             = true
generic_relationships_created_by          = "Terraform"
generic_relationships_from_role           = "terraformrole"
generic_relationships_from_type           = "os:service"
generic_relationships_to_role             = "terraformrole"
generic_relationships_to_type             = "terraformdestination"
generic_relationships_type_of_relation    = "PART_OF"
generic_relationships_sources_condition   = "$eq(terraform)"
generic_relationships_sources_source_type = "Metrics"

generic_types_name                          = "terraform:type"
generic_types_enabled                       = true
generic_types_created_by                    = "Terraform"
generic_types_display_name                  = "TerraformTest"
generic_types_rules_icon_pattern            = "{TerraformIcon}"
generic_types_rules_id_pattern              = "{TerraformPlaceholder}"
generic_types_rules_instance_name_pattern   = "{TerraformInstance}"
generic_types_rules_attributes_key          = "TerraformAttribute"
generic_types_rules_attributes_pattern      = "{TerraformExtraction}"
generic_types_rules_required_dimensions_key = "TerraformDimension"
generic_types_rules_sources_condition       = "$eq(TerraformCondition)"
generic_types_rules_sources_source_type     = "Events"

grail_security_context_entity_type          = "exampletype"
grail_security_context_destination_property = "exampleproperty"

auto_update           = true
scope_activegate      = "environment"
scope_oneagent        = "environment"
target_version        = "latest"
update_mode           = "AUTOMATIC"
name                  = "example_update"
enabled               = true
recurrence            = "ONCE"
once_recurrence_end   = "2023-12-31T23:59:59Z"
once_recurrence_start = "2023-01-01T00:00:00Z"

slo_name                        = "example_slo"
slo_enabled                     = true
slo_description                 = "Terraform Test"
slo_evaluation_type             = "AGGREGATE"
slo_evaluation_window           = "-1w"
slo_filter                      = "type(SERVICE),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)"
slo_metric_expression           = "100*(builtin:service.requestCount.server:splitBy())/(builtin:service.requestCount.server:splitBy())"
slo_metric_name                 = "terraform_test"
slo_target_success              = 95
slo_target_warning              = 98
slo_legacy_id                   = ""
burn_rate_visualization_enabled = false
fast_burn_threshold             = null


enable_copilot                  = true
enable_tenant_aware_data_mining = true
blocklist_name                  = "example-blocklist"
blocklist_type                  = "BUCKET"

custom_units_name        = "example_unit"
custom_units_description = "Created by Terraform"
custom_units_plural_name = "TerraformUnits"
custom_units_symbol      = "T/u"

histogram_metrics_enable_histogram_bucket_ingest = false

metric_metadata_display_name = "example_metric"
metric_metadata_metric_id    = "metric-func:slo.terraform-test"
metric_metadata_unit         = "percent"

metric_query_metric_id       = "metric-func:slo.terraform-test"
metric_query_metric_selector = "((100*(builtin:service.requestCount.server:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),mzId(0000000000000000000),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)\"))):splitBy())/(builtin:service.requestCount.server:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),mzId(0000000000000000000),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)\"))):splitBy())) - (95.0))"

host_group_id     = "environment"
aspnetcore        = false
cf_appsmanagerjs  = false
container         = false
docker_pauseamd64 = false
exe_bbs           = false
exe_caddy         = false
exe_schedular     = false
exe_silkdaemon    = false
go_static         = false
node_nodegyp      = false

process_availability_enabled        = true
process_availability_name           = "Process Availability Rule"
process_availability_rule_property  = "executable"
process_availability_rule_condition = "$contains(svc)"
process_availability_metadata_key   = "foo"
process_availability_metadata_value = "bar"

process_monitoring_host_group_id   = "HOST_GROUP-0000000000000000"
process_monitoring_auto_monitoring = true

process_monitoring_rule_enabled            = true
process_monitoring_rule_mode               = "MONITORING_OFF"
process_monitoring_rule_host_group_id      = "HOST_GROUP-0000000000000000"
process_monitoring_rule_condition_item     = "APACHE_CONFIG_PATH"
process_monitoring_rule_condition_operator = "STARTS"
process_monitoring_rule_condition_value    = "foo-bar-x"

process_visibility_enabled       = true
process_visibility_max_processes = 80
process_visibility_scope         = "environment"

team_name                       = "example_team"
team_description                = "Created by Terraform"
team_identifier                 = "Terraform"
team_external_id                = "external-id-example"
responsibility_development      = true
responsibility_infrastructure   = false
responsibility_line_of_business = false
responsibility_operations       = true
responsibility_security         = false
additional_info_key             = "HashiCorp"
additional_info_value           = "Terraform"
additional_info_url             = "https://www.terraform.io/"
contact_integration_type        = "JIRA"
contact_jira_default_assignee   = "example_assignee"
contact_jira_project            = "example_project"
contact_ms_teams                = "example_team@teams.microsoft.com"
contact_slack_channel           = "#example_team_channel"
contact_url                     = "https://www.example.com/contact"
link_type                       = "URL"
link_url                        = "https://www.google.com"
supplementary_identifier        = "supplementary-id-example"

enabled_vmware = false
ipaddress      = "vcenter01"
label          = "example"
password       = "your-password-here"
username       = "terraform"
filter         = "$contains(Terraform)"

application_id                                    = "environment"
enable_resource_capturing                         = true
resource_capture_url_exclusion_pattern_list       = ["www.google.com"]
enable_opt_in_mode                                = false
url_exclusion_pattern_list                        = ["www.google.com"]
playback_masking_preset                           = "MASK_ALL"
recording_masking_preset                          = "ALLOW_LIST"
recording_masking_allow_list_rules_css_expression = "selector.example"
recording_masking_allow_list_rules_target         = "ELEMENT"

custom_device_id = "customDeviceId"
display_name     = "customDevicename"
config_url       = "https://config.url"
dns_names        = ["dns1.example.com", "dns2.example.com"]
favicon_url      = "https://favicon.url/icon.png"
group            = "customGroup"
ip_addresses     = ["192.168.1.1", "192.168.1.2"]
listen_ports     = [80, 443]
props            = "key1=value1,key2=value2"
type             = "customType"
ui_based         = true

# Variables for dynatrace_log_agent_feature_flags
scope                      = "HOST-1234567890000000"
new_container_log_detector = true
journald_log_detector      = false

# Variables for dynatrace_log_buckets
enabled_buckets     = true
bucket_name         = "default_logs"
matcher_buckets     = "matchesPhrase(content, \"error\")"
rule_name_buckets   = "example_rule"
insert_after_buckets = null

# Variables for dynatrace_log_custom_attribute
sidebar_custom_attribute = false
key_custom_attribute     = "example_key"

# Variables for dynatrace_log_custom_source
name_custom_source                  = "example_name"
enabled_custom_source               = false
scope_custom_source                 = "HOST_GROUP-1234567890000000"
custom_log_source_type              = "WINDOWS_EVENT_LOG"
custom_log_source_path              = "/terraform"
enrichment_type_custom_source       = "attribute"
enrichment_key1_custom_source       = "key1"
enrichment_value1_custom_source     = "value1"
enrichment_key2_custom_source       = "key2"
enrichment_value2_custom_source     = "value2"


# Variables for dynatrace_log_events
enabled_events          = false
query_events            = "matchesPhrase(content, \"terratest\")"
summary_events          = "Created by Terraform"
event_description       = "Created by Terraform"
event_type              = "INFO"
event_title             = "{content}"
metadata_key            = "terraform.key"
metadata_value          = "terraform.value"

# Variables for dynatrace_log_metrics
enabled_metrics           = true
dimensions_metrics        = ["dt.os.type", "dt.entity.process_group"]
key_metrics               = "log.terraformexample3"
measure_metrics           = "ATTRIBUTE"
measure_attribute_metrics = "dt.entity.host"
query_metrics             = "matchesPhrase(content, \"terratest\")"

# Variables for dynatrace_log_oneagent
container_timezone_heuristic_enabled = true
containers_logs_detection_enabled    = true
date_search_limit_bytes              = 64
default_timezone                     = "Local time zone"
event_log_query_timeout_sec          = 5
iisdetection_enabled                 = true
log_scanner_linux_nfs_enabled        = false
max_lgis_per_entity_count            = 200
min_binary_detection_limit_bytes     = 512
monitor_own_logs_enabled             = false
open_log_files_detection_enabled     = true
severity_detection_limit_bytes       = 100
severity_detection_lines_limit       = 2
system_logs_detection_enabled        = true

# Variables for dynatrace_log_processing
enabled_processing       = false
query_processing         = "matchesPhrase(content, \"terratest\")"
rule_name_processing     = "example_rule"
processor_rule           = <<-EOT
  PARSE(content,"LD 'total: ' INT:total '; failed: ' INT:failed")
  | FIELDS_ADD(failed.percentage: 100.0 * failed / total + '%')
  | FIELDS_REMOVE(total, failed)
EOT
sample_log_processing = "{\"content\": \"\"}"
insert_after_processing = null

# Variables for dynatrace_log_security_context
query_security_context             = "matchesPhrase(content, \"example\")"
rule_name_security_context         = "example_rule"
value_source_security_context      = "FIELD"
value_source_field_security_context = "example_field"
value_security_context             = null
insert_after_security_context      = null

# Variables for dynatrace_log_sensitive_data_masking
name_sensitive_data_masking            = "example_name"
enabled_sensitive_data_masking         = true
scope_sensitive_data_masking           = "environment"
masking_type_sensitive_data_masking    = "STRING"
expression_sensitive_data_masking      = "FOO"
replacement_sensitive_data_masking     = "******"
matcher_attribute_sensitive_data_masking = "container.name"
matcher_operator_sensitive_data_masking  = "MATCHES"
matcher_values_sensitive_data_masking    = ["jlkjk"]
insert_after_sensitive_data_masking      = null

# Variables for dynatrace_log_storage
name_storage            = "example_name"
enabled_storage         = false
scope_storage           = "HOST_GROUP-1234567890000000"
send_to_storage         = false
matcher_attribute_storage = "container.name"
matcher_operator_storage  = "MATCHES"
matcher_values_storage    = ["TerraformTest"]
insert_after_storage      = null

# Variables for dynatrace_log_timestamp
enabled_timestamp           = false
config_item_title_timestamp = "example_title"
date_time_pattern_timestamp = "%m/%d/%Y %I:%M:%S %p"
scope_timestamp             = "environment"
timezone_timestamp          = "America/Detroit"
matcher_attribute_timestamp = "container.name"
matcher_operator_timestamp  = "MATCHES"
matcher_values_timestamp    = ["terraform"]
insert_after_timestamp      = null

activegate_token_config = {
  auth_token_enforcement_manually_enabled = false
  expiring_token_notifications_enabled    = true
}

ag_token_config = {
  type            = "ENVIRONMENT"
  expiration_date = "now+3d"
  name            = "example_ag_token"
}

api_token_config = {
  name    = "example_api_token"
  enabled = false
  scopes  = ["geographicRegions.read"]
}

token_settings_config = {
  new_token_format = true
  personal_tokens  = true
}

aws_anomalies_name                   = "aws_anomalies"
custom_app_scope                     = "CUSTOM_APPLICATION-1234567890000000"
custom_app_crash_rate_scope          = "CUSTOM_APPLICATION-1234567890000000"
database_anomalies_scope             = "environment"
davis_anomaly_detectors_name         = "davis_anomaly_detectors"
disk_anomalies_scope                 = "environment"
disk_anomaly_rules_name              = "disk_anomaly_rules"
disk_edge_anomaly_detectors_name     = "disk_edge_anomaly_detectors"
disk_specific_anomalies_disk_id      = "DISK-1234567890000000"
host_anomalies_scope                 = "HOST-1234567890000000"
k8s_cluster_anomalies_scope          = "environment"
k8s_namespace_anomalies_scope        = "environment"
k8s_node_anomalies_scope             = "environment"
k8s_pvc_anomalies_scope              = "environment"
k8s_workload_anomalies_scope         = "environment"
metric_events_name                   = "metric_events"
mobile_app_scope                     = "MOBILE_APPLICATION-1234567890000000"
mobile_app_crash_rate_application_id = "MOBILE_APPLICATION-1234567890000000"
service_anomalies_scope              = "SERVICE-1234567890000000"
vmware_anomalies_name                = "vmware_anomalies"
web_app_scope                        = "APPLICATION-1234567890000000"