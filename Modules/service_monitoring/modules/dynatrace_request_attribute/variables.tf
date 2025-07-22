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
# --- Data source block ---
variable "data_source_enabled" {
  description = "Whether the data source is enabled."
  type        = bool
  default     = true
}

variable "data_source_source" {
  description = "The source type (e.g., METHOD_PARAM, HEADER)."
  type        = string
  default     = "METHOD_PARAM"
}

variable "data_source_technology" {
  description = "Technology the source applies to (e.g., JAVA, DOTNET, NODEJS)."
  type        = string
  default     = "JAVA"
}

# --- Method block ---
variable "method_capture" {
  description = "Whether to capture data from this method."
  type        = bool
  default     = true
}

variable "method_argument_types" {
  description = "List of method argument types (e.g., [\"java.lang.String\"])."
  type        = list(string)
  default     = ["java.lang.String"]
}

variable "method_class_name" {
  description = "Fully qualified class name where the method resides."
  type        = string
  default     = "com.example.MyClass"
}

variable "method_method_name" {
  description = "The name of the method to monitor."
  type        = string
  default     = "myMethod"
}

variable "method_return_type" {
  description = "Return type of the method."
  type        = string
  default     = "void"
}

variable "method_visibility" {
  description = "Visibility of the method (e.g., PUBLIC, PRIVATE)."
  type        = string
  default     = "PUBLIC"
}

# --- Value processing block ---
variable "value_processing_split_at" {
  description = "Character to split the captured value at."
  type        = string
  default     = "="
}

variable "value_processing_trim" {
  description = "Whether to trim whitespace from the value."
  type        = bool
  default     = true
}

variable "value_processing_value_extractor_regex" {
  description = "Regex pattern to extract part of the value."
  type        = string
  default     = ".*"
}

# --- Extract substring block ---
variable "extract_substring_delimiter" {
  description = "Delimiter to extract substring."
  type        = string
  default     = "-"
}

variable "extract_substring_position" {
  description = "Position to extract substring from after splitting."
  type        = number
  default     = 0
}

# --- Value condition block ---
variable "value_condition_negate" {
  description = "Whether to negate the condition."
  type        = bool
  default     = false
}

variable "value_condition_operator" {
  description = "Condition operator (e.g., EQUALS, CONTAINS)."
  type        = string
  default     = "EQUALS"
}

variable "value_condition_value" {
  description = "Value to use for condition comparison."
  type        = string
  default     = "myExpectedValue"
}
