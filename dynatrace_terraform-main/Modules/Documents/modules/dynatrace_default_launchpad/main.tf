resource "dynatrace_default_launchpad" "this" {
  for_each = var.default_launchpads

  group_launchpads {
    dynamic "group_launchpad" {
      for_each = each.value.group_launchpads
      content {
        is_enabled    = group_launchpad.value.is_enabled
        launchpad_id  = group_launchpad.value.launchpad_id
        user_group_id = group_launchpad.value.user_group_id
      }
    }
  }
}
