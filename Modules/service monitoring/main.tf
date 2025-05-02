resource "dynatrace_api_detection" "example" {
  api_color       = var.api_color
  api_name        = var.api_name
  third_party_api = var.third_party_api
  technology      = var.technology

  conditions {
    condition {
      base    = var.condition_base
      matcher = var.condition_matcher
      pattern = var.condition_pattern
    }
  }
}

resource "dynatrace_calculated_service_metric" "example" {
  name             = var.metric_name
  enabled          = var.metric_enabled
  management_zones = var.management_zones
  metric_key       = var.metric_key
  unit             = var.metric_unit

  conditions {
    condition {
      attribute = var.condition_attribute
      comparison {
        negate = var.comparison_negate
        http_method {
          operator = var.http_method_operator
          values   = var.http_method_values
        }
      }
    }
  }

  metric_definition {
    metric            = var.metric_definition_metric
    request_attribute = var.metric_definition_request_attribute
  }
}

resource "dynatrace_key_requests" "example" {
  service         = var.service_id
  key_request_ids = var.key_request_ids
  names           = var.key_request_names
}

resource "dynatrace_muted_requests" "example" {
  service_id          = var.service_id
  muted_request_names = var.muted_request_names
}

resource "dynatrace_request_attribute" "example" {
  name                       = var.request_attribute_name
  enabled                    = var.request_attribute_enabled
  aggregation                = var.request_attribute_aggregation
  confidential               = var.request_attribute_confidential
  data_type                  = var.request_attribute_data_type
  normalization              = var.request_attribute_normalization
  skip_personal_data_masking = var.request_attribute_skip_personal_data_masking

  data_sources {
    enabled    = var.data_source_enabled
    source     = var.data_source_source
    technology = var.data_source_technology

    methods {
      capture = var.method_capture
      method {
        argument_types = var.method_argument_types
        class_name     = var.method_class_name
        method_name    = var.method_method_name
        return_type    = var.method_return_type
        visibility     = var.method_visibility
      }
    }

    value_processing {
      split_at              = var.value_processing_split_at
      trim                  = var.value_processing_trim
      value_extractor_regex = var.value_processing_value_extractor_regex
      extract_substring {
        delimiter = var.extract_substring_delimiter
        position  = var.extract_substring_position
      }
      value_condition {
        negate   = var.value_condition_negate
        operator = var.value_condition_operator
        value    = var.value_condition_value
      }
    }
  }
}

resource "dynatrace_service_naming" "example" {
  name    = var.service_naming_name
  enabled = var.service_naming_enabled
  format  = var.service_naming_format

  conditions {
    condition {
      key {
        type      = var.service_naming_key_type
        attribute = var.service_naming_key_attribute
      }
      service_type {
        negate   = var.service_naming_service_type_negate
        operator = var.service_naming_service_type_operator
        value    = var.service_naming_service_type_value
      }
    }
  }
}

resource "dynatrace_url_based_sampling" "example" {
  enabled              = var.url_based_sampling_enabled
  factor               = var.url_based_sampling_factor
  http_method_any      = var.url_based_sampling_http_method_any
  ignore               = var.url_based_sampling_ignore
  path                 = var.url_based_sampling_path
  path_comparison_type = var.url_based_sampling_path_comparison_type

  query_parameters {
    parameter {
      name               = var.query_parameter_name
      value              = var.query_parameter_value
      value_is_undefined = var.query_parameter_value_is_undefined
    }
  }
}
