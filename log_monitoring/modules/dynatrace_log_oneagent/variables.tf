variable "log_oneagent" {
  description = "Advanced OneAgent log settings and thresholds"
  type = map(object({
    container_timezone_heuristic_enabled = bool
    containers_logs_detection_enabled    = bool
    date_search_limit_bytes              = number
    default_timezone                     = string
    event_log_query_timeout_sec          = number
    iisdetection_enabled                 = bool
    log_scanner_linux_nfs_enabled        = bool
    max_lgis_per_entity_count            = number
    min_binary_detection_limit_bytes     = number
    monitor_own_logs_enabled             = bool
    open_log_files_detection_enabled     = bool
    scope                                = string
    severity_detection_limit_bytes       = number
    severity_detection_lines_limit       = number
    system_logs_detection_enabled        = bool
  }))
  default = {}
}
