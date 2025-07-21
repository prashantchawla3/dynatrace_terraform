variable "api_color" {
  description = "Color label to visually identify the API in UI elements."
  type        = string
  default     = "#00A3E0"
}

variable "api_name" {
  description = "Logical name of the API being modeled."
  type        = string
  default     = "easytrade-api"
}

variable "third_party_api" {
  description = "Boolean flag indicating whether the API is externally owned."
  type        = bool
  default     = false
}

variable "technology" {
  description = "Technology stack used by the service or API (e.g. JAVA, DOTNET)."
  type        = string
  default     = "JAVA"
}

variable "condition_base" {
  description = "Base condition used for request matching (e.g. path segment, header)."
  type        = string
  default     = "url-path"
}

variable "condition_matcher" {
  description = "Matching operation used in condition evaluation (e.g. EQUALS, CONTAINS)."
  type        = string
  default     = "BEGINS"
}

variable "condition_pattern" {
  description = "Pattern used to evaluate the base condition match."
  type        = string
  default     = "/api"
}

variable "metric_name" {
  description = "Display name of the custom metric being created."
  type        = string
  default     = "Request Duration"
}

variable "metric_enabled" {
  description = "Flag to enable or disable creation of the custom metric."
  type        = bool
  default     = true
}

variable "management_zones" {
  description = "List of management zones used for visibility or scoping."
  type        = list(string)
  default     = ["Platform"]
}

variable "metric_key" {
  description = "Logical key of the metric used for referencing internally."
  type        = string
  default     = "easytrade.req.duration"
}

variable "metric_unit" {
  description = "Unit of measurement for the custom metric."
  type        = string
  default     = "MICRO_SECOND"
}

variable "condition_attribute" {
  description = "Attribute used to scope the condition rule (e.g. URL_PATH, HTTP_METHOD)."
  type        = string
  default     = "URL_PATH"
}

variable "comparison_negate" {
  description = "If true, the condition result will be inverted."
  type        = bool
  default     = false
}

variable "http_method_operator" {
  description = "Operator used for HTTP method comparison (e.g. CONTAINS)."
  type        = string
  default     = "EQUALS"
}

variable "http_method_values" {
  description = "List of HTTP methods used for condition filtering."
  type        = list(string)
  default     = ["GET", "POST"]
}

variable "metric_definition_metric" {
  description = "Dynatrace metric expression or builtin name."
  type        = string
  default     = "builtin:service.response.time"
}

variable "metric_definition_request_attribute" {
  description = "Request attribute used as a source for the custom metric."
  type        = string
  default     = "x-response-time"
}

variable "service_id" {
  description = "Logical service ID used for scoping rules and metrics."
  type        = string
  default     = "SERVICE-EASYTRADE-BUY"
}

variable "key_request_ids" {
  description = "Map of key request identifiers with their display names."
  type        = map(string)
  default     = {}
}

variable "key_request_names" {
  description = "List of request names considered critical (key requests)."
  type        = list(string)
  default     = []
}

variable "muted_request_names" {
  description = "List of request names to be excluded from alerting or visibility."
  type        = list(string)
  default     = []
}

variable "request_attribute_name" {
  description = "Name of the request attribute to be extracted."
  type        = string
  default     = "x-trace-id"
}

variable "request_attribute_enabled" {
  description = "Flag to enable extraction of the request attribute."
  type        = bool
  default     = true
}

variable "request_attribute_aggregation" {
  description = "Aggregation strategy for attribute values (e.g. FIRST, LAST)."
  type        = string
  default     = "FIRST"
}

variable "request_attribute_confidential" {
  description = "If true, treats the attribute value as sensitive."
  type        = bool
  default     = false
}

variable "request_attribute_data_type" {
  description = "Data type of the request attribute (e.g. STRING, NUMBER)."
  type        = string
  default     = "STRING"
}

variable "request_attribute_normalization" {
  description = "Normalization behavior applied (e.g. NONE, LOWERCASE)."
  type        = string
  default     = "NONE"
}

variable "request_attribute_skip_personal_data_masking" {
  description = "Flag to skip Dynatrace's personal data masking."
  type        = bool
  default     = false
}

variable "data_source_enabled" {
  description = "Flag to enable creation of a custom data source."
  type        = bool
  default     = false
}

variable "data_source_source" {
  description = "Source name or label of the data source."
  type        = string
  default     = "easytrade-datasource"
}

variable "data_source_technology" {
  description = "Technology associated with the data source (e.g. JAVA, NODEJS)."
  type        = string
  default     = "JAVA"
}

variable "method_capture" {
  description = "Flag to enable instrumentation of a method."
  type        = bool
  default     = false
}

variable "method_argument_types" {
  description = "List of argument types used in method definition."
  type        = list(string)
  default     = []
}

variable "method_class_name" {
  description = "Fully qualified name of the class."
  type        = string
  default     = "com.easytrade.controller.OrderController"
}

variable "method_method_name" {
  description = "Method name to be instrumented."
  type        = string
  default     = "buyAsset"
}

variable "method_return_type" {
  description = "Return type of the method (e.g. void, int)."
  type        = string
  default     = "void"
}

variable "method_visibility" {
  description = "Visibility of the method (e.g. PUBLIC, PRIVATE)."
  type        = string
  default     = "PUBLIC"
}

variable "value_processing_split_at" {
  description = "Delimiter used to split extracted value."
  type        = string
  default     = ":"
}

variable "value_processing_trim" {
  description = "Enable trimming of extracted values."
  type        = bool
  default     = true
}

variable "value_processing_value_extractor_regex" {
  description = "Regex pattern used for value extraction."
  type        = string
  default     = "[A-Z]{3}-\\d{4}"
}

variable "extract_substring_delimiter" {
  description = "Delimiter used for substring extraction."
  type        = string
  default     = "/"
}

variable "extract_substring_position" {
  description = "Position index of the substring to extract."
  type        = number
  default     = 2
}

variable "value_condition_negate" {
  description = "Negates the condition logic if true."
  type        = bool
  default     = false
}

variable "value_condition_operator" {
  description = "Operator used in value condition (e.g. EQUALS)."
  type        = string
  default     = "EQUALS"
}

variable "value_condition_value" {
  description = "Expected value used in conditional evaluation."
  type        = string
  default     = "BUY"
}

variable "service_naming_name" {
  description = "Name label of the service naming rule."
  type        = string
  default     = "Dynamic Service Name"
}

variable "service_naming_enabled" {
  description = "Enable flag for service naming rule."
  type        = bool
  default     = true
}

variable "service_naming_format" {
  description = "Naming format string with placeholders."
  type        = string
  default     = "{method}-{path}"
}

variable "service_naming_key_type" {
  description = "Type of key used (e.g. REQUEST_ATTRIBUTE)."
  type        = string
  default     = "REQUEST_ATTRIBUTE"
}

variable "service_naming_key_attribute" {
  description = "Key used from request attribute for naming."
  type        = string
  default     = "x-app-name"
}

variable "service_naming_service_type_negate" {
  description = "Negate match logic on service type."
  type        = bool
  default     = false
}

variable "service_naming_service_type_operator" {
  description = "Comparison operator for service type."
  type        = string
  default     = "EQUALS"
}

variable "service_naming_service_type_value" {
  description = "Service type value used for conditional matching (e.g. CUSTOM_SERVICE, WEB_SERVICE)."
  type        = string
  default     = "CUSTOM_SERVICE"
}

variable "url_based_sampling_enabled" {
  description = "Enables traffic sampling based on URL path patterns."
  type        = bool
  default     = true
}

variable "url_based_sampling_factor" {
  description = "Sampling rate factor (e.g. 5 means 1 out of every 5 requests is retained)."
  type        = number
  default     = 5
}

variable "url_based_sampling_http_method_any" {
  description = "If true, sampling applies to all HTTP methods regardless of value."
  type        = bool
  default     = true
}

variable "url_based_sampling_ignore" {
  description = "If true, ignores the sampling configuration for matching URLs."
  type        = bool
  default     = false
}

variable "url_based_sampling_path" {
  description = "URL path pattern used for sampling filter."
  type        = string
  default     = "/api/"
}

variable "url_based_sampling_path_comparison_type" {
  description = "Comparison logic for path evaluation (e.g. BEGINS, CONTAINS)."
  type        = string
  default     = "BEGINS"
}

variable "query_parameter_name" {
  description = "Name of the query parameter evaluated in rules or naming logic."
  type        = string
  default     = "user"
}

variable "query_parameter_value" {
  description = "Expected value of the query parameter (e.g. admin, guest)."
  type        = string
  default     = "admin"
}

variable "query_parameter_value_is_undefined" {
  description = "If true, value can be undefined or absent in evaluation."
  type        = bool
  default     = false
}

variable "naming_pattern" {
  description = "Default naming pattern used when constructing request names."
  type        = string
  default     = "{method}-{path}"
}

variable "request_naming_rules" {
  description = "Map of request naming rules with associated conditions and optional placeholders."
  type = map(object({
    naming_pattern   = string
    enabled          = optional(bool)
    management_zones = optional(set(string))
    conditions = list(object({
      condition = list(object({
        attribute  = string
        comparison = optional(object({
          fast_string = object({
            value    = string
            operator = string
          })
        }))
      }))
    }))
    placeholders = optional(object({
      placeholder = list(object({
        name      = string
        kind      = string
        attribute = string
      }))
    }))
  }))
  default = {}
}

variable "request_naming_ids" {
  description = "List of request naming rule IDs in execution order."
  type        = list(string)
  default     = []
}

variable "service_naming_rule_ids" {
  description = "List of service naming rule IDs in execution order."
  type        = list(string)
  default     = []
}
