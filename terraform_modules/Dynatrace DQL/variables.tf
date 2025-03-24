variable "query" {
  description = "The DQL query string"
  type        = string
}

variable "default_sampling_ratio" {
  description = "The default sampling ratio"
  type        = number
  default     = 1
}

variable "default_scan_limit_gbytes" {
  description = "Limit in gigabytes for the amount of data that will be scanned during read"
  type        = number
  default     = 10
}

variable "default_timeframe_end" {
  description = "The query timeframe 'end' timestamp in ISO-8601 or RFC3339 format"
  type        = string
  default     = ""
}

variable "default_timeframe_start" {
  description = "The query timeframe 'start' timestamp in ISO-8601 or RFC3339 format"
  type        = string
  default     = ""
}

variable "fetch_timeout_seconds" {
  description = "The query will stop reading data after reaching the fetch-timeout"
  type        = number
  default     = 60
}

variable "locale" {
  description = "The query locale"
  type        = string
  default     = "en"
}

variable "max_result_bytes" {
  description = "The maximum number of result bytes that this query will return"
  type        = number
  default     = 1048576
}

variable "max_result_records" {
  description = "The maximum number of result records that this query will return"
  type        = number
  default     = 1000
}

variable "request_timeout_milliseconds" {
  description = "The time a client is willing to wait for the query result"
  type        = number
  default     = 30000
}

variable "timezone" {
  description = "The query timezone"
  type        = string
  default     = "UTC"
}
variable "automation_client_id" {
  description = "OAuth Client ID for the Dynatrace Automation API"
  type        = string
}