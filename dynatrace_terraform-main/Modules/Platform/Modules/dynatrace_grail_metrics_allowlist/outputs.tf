output "grail_metrics_allowlist_ids" {
  description = "Map of Grail metrics allowlist configurations and their resource IDs"
  value = {
    for key, res in dynatrace_grail_metrics_allowlist.this :
    key => res.id
  }
}

output "grail_metrics_allowlist_rules" {
  description = "Map of allowlist keys to their allow rules"
  value = {
    for key, res in dynatrace_grail_metrics_allowlist.this :
    key => [
      for rule in res.allow_rules[0].allow_rule : {
        enabled    = rule.enabled
        metric_key = rule.metric_key
        pattern    = rule.pattern
      }
    ]
  }
}
