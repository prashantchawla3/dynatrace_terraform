module "api_detection" {
  source            = "./modules/dynatrace_api_detection"
  api_color         = var.api_color
  api_name          = var.api_name
  third_party_api   = var.third_party_api
  technology        = var.technology
  condition_base    = var.condition_base
  condition_matcher = var.condition_matcher
  condition_pattern = var.condition_pattern
}

module "calculated_service_metric" {
  source                                 = "./modules/dynatrace_calculated_service_metric"
  metric_name                            = var.metric_name
  metric_enabled                         = var.metric_enabled
  management_zones                       = var.management_zones
  metric_key                             = var.metric_key
  metric_unit                            = var.metric_unit
  condition_attribute                    = var.condition_attribute
  comparison_negate                      = var.comparison_negate
  http_method_operator                   = var.http_method_operator
  http_method_values                     = var.http_method_values
  metric_definition_metric               = var.metric_definition_metric
  metric_definition_request_attribute    = var.metric_definition_request_attribute
}

module "key_requests" {
  source            = "./modules/dynatrace_key_requests"
  service_id        = var.service_id
  key_request_ids   = var.key_request_ids
  key_request_names = var.key_request_names
}

module "muted_requests" {
  source              = "./modules/dynatrace_muted_requests"
  service_id          = var.service_id
  muted_request_names = var.muted_request_names
}

module "request_attribute" {
  source                                         = "./modules/dynatrace_request_attribute"
  request_attribute_name                         = var.request_attribute_name
  request_attribute_enabled                      = var.request_attribute_enabled
  request_attribute_aggregation                  = var.request_attribute_aggregation
  request_attribute_confidential                 = var.request_attribute_confidential
  request_attribute_data_type                    = var.request_attribute_data_type
  request_attribute_normalization                = var.request_attribute_normalization
  request_attribute_skip_personal_data_masking   = var.request_attribute_skip_personal_data_masking
  data_source_enabled                            = var.data_source_enabled
  data_source_source                             = var.data_source_source
  data_source_technology                         = var.data_source_technology
  method_capture                                 = var.method_capture
  method_argument_types                          = var.method_argument_types
  method_class_name                              = var.method_class_name
  method_method_name                             = var.method_method_name
  method_return_type                             = var.method_return_type
  method_visibility                              = var.method_visibility
  value_processing_split_at                      = var.value_processing_split_at
  value_processing_trim                          = var.value_processing_trim
  value_processing_value_extractor_regex         = var.value_processing_value_extractor_regex
  extract_substring_delimiter                    = var.extract_substring_delimiter
  extract_substring_position                     = var.extract_substring_position
  value_condition_negate                         = var.value_condition_negate
  value_condition_operator                       = var.value_condition_operator
  value_condition_value                          = var.value_condition_value
}

module "service_naming" {
  source                             = "./modules/dynatrace_service-naming"
  service_naming_name                = var.service_naming_name
  service_naming_enabled             = var.service_naming_enabled
  service_naming_format              = var.service_naming_format
  service_naming_key_type            = var.service_naming_key_type
  service_naming_key_attribute       = var.service_naming_key_attribute
  service_naming_service_type_negate = var.service_naming_service_type_negate
  service_naming_service_type_operator = var.service_naming_service_type_operator
  service_naming_service_type_value  = var.service_naming_service_type_value
}

module "url_based_sampling" {
  source                                 = "./modules/dynatrace_url_based_sampling"
  url_based_sampling_enabled             = var.url_based_sampling_enabled
  url_based_sampling_factor              = var.url_based_sampling_factor
  url_based_sampling_http_method_any     = var.url_based_sampling_http_method_any
  url_based_sampling_ignore              = var.url_based_sampling_ignore
  url_based_sampling_path                = var.url_based_sampling_path
  url_based_sampling_path_comparison_type = var.url_based_sampling_path_comparison_type
  query_parameter_name                   = var.query_parameter_name
  query_parameter_value                  = var.query_parameter_value
  query_parameter_value_is_undefined     = var.query_parameter_value_is_undefined
}

module "request_naming" {
  source               = "./modules/dynatrace_request_naming"
  request_naming_rules = var.request_naming_rules
}

module "request_namings" {
  source             = "./modules/dynatrace_request_namings"
  request_naming_ids = var.request_naming_ids
}

module "service_naming_order" {
  source                  = "./modules/dynatrace_service_naming_order"
  service_naming_rule_ids = var.service_naming_rule_ids
}
