output "oneagent_features_config" {
  value = [
    for r in var.oneagent_features_resources : {
      enabled        = r.settings.oneagent_features.enabled
      instrumentation = r.settings.oneagent_features.instrumentation
      key            = r.settings.oneagent_features.key
      scope          = r.settings.oneagent_features.scope
    }
  ]
}