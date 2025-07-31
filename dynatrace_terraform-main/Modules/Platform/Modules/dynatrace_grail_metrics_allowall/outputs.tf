output "grail_metrics_allowall_ids" {
  description = "Map of Grail metrics allow-all configurations and their resource IDs"
  value = {
    for key, res in dynatrace_grail_metrics_allowall.this :
    key => res.id
  }
}

output "grail_metrics_allowall_settings" {
  description = "Map of Grail metrics allow-all settings"
  value = {
    for key, res in dynatrace_grail_metrics_allowall.this :
    key => res.allow_all
  }
}
