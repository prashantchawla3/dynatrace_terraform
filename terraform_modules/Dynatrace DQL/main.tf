data "dynatrace_dql" "example" {
  query                   = var.query
  default_sampling_ratio  = var.default_sampling_ratio
  default_scan_limit_gbytes = var.default_scan_limit_gbytes
  default_timeframe_end   = var.default_timeframe_end
  default_timeframe_start = var.default_timeframe_start
  fetch_timeout_seconds   = var.fetch_timeout_seconds
  locale                  = var.locale
  max_result_bytes        = var.max_result_bytes
  max_result_records      = var.max_result_records
  request_timeout_milliseconds = var.request_timeout_milliseconds
  timezone                = var.timezone
}