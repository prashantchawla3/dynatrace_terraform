resource "dynatrace_oneagent_default_mode" "this" {
  for_each = {
    for r in var.oneagent_default_mode_resources : r.name => r
    if r.settings.oneagent_default_mode != null
  }

  default_mode = each.value.settings.oneagent_default_mode.default_mode
}
