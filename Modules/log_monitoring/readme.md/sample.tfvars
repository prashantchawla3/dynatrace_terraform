
scope = "HOST-1234567890000000"
new_container_log_detector = true
journald_log_detector = false

enabled_buckets = true
bucket_name = "default_logs"
matcher_buckets = "matchesPhrase(content, \"error\")"
rule_name_buckets = "example_rule"
insert_after_buckets = null

sidebar_custom_attribute = false
key_custom_attribute = "example_key"

name_custom_source = "example_name"
enabled_custom_source = false
scope_custom_source = "HOST_GROUP-1234567890000000"
custom_log_source_type = "WINDOWS_EVENT_LOG"
custom_log_source_path = "/terraform"
enrichment_type_custom_source = "attribute"
enrichment_key1_custom_source = "key1"
enrichment_value1_custom_source = "value1"
enrichment_key2_custom_source = "key2"
enrichment_value2_custom_source = "value2"
