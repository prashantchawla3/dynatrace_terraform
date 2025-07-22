resource "dynatrace_log_oneagent" "this" {
  for_each = var.resources["log_oneagent"]

  container_timezone_heuristic_enabled = each.value.container_timezone_heuristic_enabled
  containers_logs_detection_enabled    = each.value.containers_logs_detection_enabled
  date_search_limit_bytes              = each.value.date_search_limit_bytes
  default_timezone                     = each.value.default_timezone
  event_log_query_timeout_sec          = each.value.event_log_query_timeout_sec
  iisdetection_enabled                 = each.value.iisdetection_enabled
  log_scanner_linux_nfs_enabled        = each.value.log_scanner_linux_nfs_enabled
  max_lgis_per_entity_count            = each.value.max_lgis_per_entity_count
  min_binary_detection_limit_bytes     = each.value.min_binary_detection_limit_bytes
  monitor_own_logs_enabled             = each.value.monitor_own_logs_enabled
  open_log_files_detection_enabled     = each.value.open_log_files_detection_enabled
  scope                                = each.value.scope
  severity_detection_limit_bytes       = each.value.severity_detection_limit_bytes
  severity_detection_lines_limit       = each.value.severity_detection_lines_limit
  system_logs_detection_enabled        = each.value.system_logs_detection_enabled
}
