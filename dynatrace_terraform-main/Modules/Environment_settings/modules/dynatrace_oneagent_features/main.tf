resource "dynatrace_oneagent_features" "this" {
  for_each = {
    for r in var.oneagent_features_resources : r.name => r
    if r.settings.oneagent_features != null
  }

  enabled         = each.value.settings.oneagent_features.enabled
  instrumentation = each.value.settings.oneagent_features.instrumentation
  key             = each.value.settings.oneagent_features.key
  scope           = each.value.settings.oneagent_features.scope
}
