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
