variable "scope" { description = "Scope (HOST, HOST_GROUP, etc.)"; type = string }
variable "new_container_log_detector" { description = "Detect all container logs"; type = bool }
variable "journald_log_detector" { description = "Enable journald logs"; type = bool }

variable "enabled_buckets" { description = "Enable log bucket"; type = bool }
variable "bucket_name" { description = "Bucket name"; type = string }
variable "matcher_buckets" { description = "DQL matcher"; type = string }
variable "rule_name_buckets" { description = "Rule name"; type = string }
variable "insert_after_buckets" { description = "Insert order ID"; type = string }

variable "sidebar_custom_attribute" { description = "Enable sidebar for custom attr"; type = bool }
variable "key_custom_attribute" { description = "Key for custom attr"; type = string }

variable "name_custom_source" { description = "Name of custom source"; type = string }
variable "enabled_custom_source" { description = "Enable source"; type = bool }
variable "scope_custom_source" { description = "Scope of source"; type = string }
variable "custom_log_source_type" { description = "Source type"; type = string }
variable "custom_log_source_path" { description = "Log path"; type = string }
variable "enrichment_type_custom_source" { description = "Type of enrichment"; type = string }
variable "enrichment_key1_custom_source" { description = "Enrichment key 1"; type = string }
variable "enrichment_value1_custom_source" { description = "Enrichment value 1"; type = string }
variable "enrichment_key2_custom_source" { description = "Enrichment key 2"; type = string }
variable "enrichment_value2_custom_source" { description = "Enrichment value 2"; type = string }