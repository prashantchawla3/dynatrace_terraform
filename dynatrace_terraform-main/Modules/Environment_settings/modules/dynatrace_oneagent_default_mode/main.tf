resource "dynatrace_oneagent_default_mode" "this" {
  for_each = {
    for r in var.resources : r.name => r
    if r.type == "oneagent_default_mode" && r.settings.oneagent_default_mode != null
  }

  default_mode = each.value.settings.oneagent_default_mode.default_mode
}
