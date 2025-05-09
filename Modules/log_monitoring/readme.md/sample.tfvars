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
name_custom_source              = "example_name"
enabled_custom_source           = false
scope_custom_source             = "HOST_GROUP-1234567890000000"
custom_log_source_type          = "WINDOWS_EVENT_LOG"
custom_log_source_path          = "/terraform"
enrichment_type_custom_source   = "attribute"
enrichment_key1_custom_source   = "key1"
enrichment_value1_custom_source = "value1"
enrichment_key2_custom_source   = "key2"
enrichment_value2_custom_source = "value2"

# Variables for dynatrace_log_events
enabled_events     = false
query_events       = "matchesPhrase(content, \"terratest\")"
summary_events     = "Created by Terraform"
event_description  = "Created by Terraform"
event_type         = "INFO"
event_title        = "{content}"
metadata_key       = "terraform.key"
metadata_value     = "terraform.value"

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
scope_oneagent                       = "environment"
severity_detection_limit_bytes       = 100
severity_detection_lines_limit       = 2
system_logs_detection_enabled        = true

# Variables for dynatrace_log_processing
enabled_processing       = false
query_processing         = "matchesPhrase(content, \"terratest\")"
rule_name_processing     = "example_rule"
processor_rule           = <<-EOT
  PARSE(content,\"LD 'total: ' INT:total '; failed: ' INT:failed\")
  | FIELDS_ADD(failed.percentage: 100.0 * failed / total + '%')
  | FIELDS_REMOVE(total, failed)
EOT
sample_log_processing     = "{\"content\": \"\"}"
insert_after_processing   = null

# Variables for dynatrace_log_security_context
query_security_context              = "matchesPhrase(content, \"example\")"
rule_name_security_context          = "example_rule"
value_source_security_context       = "FIELD"
value_source_field_security_context = "example_field"
value_security_context              = null
insert_after_security_context       = null

# Variables for dynatrace_log_sensitive_data_masking
name_sensitive_data_masking             = "example_name"
enabled_sensitive_data_masking          = true
scope_sensitive_data_masking            = "environment"
masking_type_sensitive_data_masking     = "STRING"
expression_sensitive_data_masking       = "FOO"
replacement_sensitive_data_masking      = "******"
matcher_attribute_sensitive_data_masking = "container.name"
matcher_operator_sensitive_data_masking  = "MATCHES"
matcher_values_sensitive_data_masking    = ["jlkjk"]
insert_after_sensitive_data_masking      = null

# Variables for dynatrace_log_storage
name_storage              = "example_name"
enabled_storage           = false
scope_storage             = "HOST_GROUP-1234567890000000"
send_to_storage           = false
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

