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
