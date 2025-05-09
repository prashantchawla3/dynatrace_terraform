variable "api_color" {
  type = string
}

variable "api_name" {
  type = string
}

variable "third_party_api" {
  type = bool
}

variable "technology" {
  type = string
}

variable "condition_base" {
  type = string
}

variable "condition_matcher" {
  type = string
}

variable "condition_pattern" {
  type = string
}

variable "metric_name" {
  type = string
}

variable "metric_enabled" {
  type = bool
}

variable "management_zones" {
  type = list(string)
}

variable "metric_key" {
  type = string
}

variable "metric_unit" {
  type = string
}

variable "condition_attribute" {
  type = string
}

variable "comparison_negate" {
  type = bool
}

variable "http_method_operator" {
  type = string
}

variable "http_method_values" {
  type = list(string)
}

variable "metric_definition_metric" {
  type = string
}

variable "metric_definition_request_attribute" {
  type = string
}

variable "service_id" {
  type = string
}

variable "key_request_ids" {
  type = list(string)
}

variable "key_request_names" {
  type = list(string)
}

variable "muted_request_names" {
  type = list(string)
}

variable "request_attribute_name" {
  type = string
}

variable "request_attribute_enabled" {
  type = bool
}

variable "request_attribute_aggregation" {
  type = string
}

variable "request_attribute_confidential" {
  type = bool
}

variable "request_attribute_data_type" {
  type = string
}

variable "request_attribute_normalization" {
  type = string
}

variable "request_attribute_skip_personal_data_masking" {
  type = bool
}

variable "data_source_enabled" {
  type = bool
}

variable "data_source_source" {
  type = string
}

variable "data_source_technology" {
  type = string
}

variable "method_capture" {
  type = bool
}

variable "method_argument_types" {
  type = list(string)
}

variable "method_class_name" {
  type = string
}

variable "method_method_name" {
  type = string
}

variable "method_return_type" {
  type = string
}

variable "method_visibility" {
  type = string
}

variable "value_processing_split_at" {
  type = string
}

variable "value_processing_trim" {
  type = bool
}

variable "value_processing_value_extractor_regex" {
  type = string
}

variable "extract_substring_delimiter" {
  type = string
}

variable "extract_substring_position" {
  type = number
}

variable "value_condition_negate" {
  type = bool
}

variable "value_condition_operator" {
  type = string
}

variable "value_condition_value" {
  type = string
}

variable "service_naming_name" {
  type = string
}

variable "service_naming_enabled" {
  type = bool
}

variable "service_naming_format" {
  type = string
}

variable "service_naming_key_type" {
  type = string
}

variable "service_naming_key_attribute" {
  type = string
}

variable "service_naming_service_type_negate" {
  type = bool
}

variable "service_naming_service_type_operator" {
  type = string
}

variable "service_naming_service_type_value" {
  type = string
}

variable "url_based_sampling_enabled" {
  type = bool
}

variable "url_based_sampling_factor" {
  type = number
}

variable "url_based_sampling_http_method_any" {
  type = bool
}

variable "url_based_sampling_ignore" {
  type = bool
}

variable "url_based_sampling_path" {
  type = string
}

variable "url_based_sampling_path_comparison_type" {
  type = string
}

variable "query_parameter_name" {
  type = string
}

variable "query_parameter_value" {
  type = string
}

variable "query_parameter_value_is_undefined" {
  type = bool
}

variable "naming_pattern" {
  type = string
}
