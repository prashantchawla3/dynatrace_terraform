resource "dynatrace_disk_options" "this" {
  for_each = {
    for r in var.resources : r.name => r
    if r.type == "disk_options" && r.settings.disk_options != null
  }

  disable_nfs_disk_monitoring = each.value.settings.disk_options.disable_nfs_disk_monitoring
  nfs_show_all                = each.value.settings.disk_options.nfs_show_all
  scope                       = each.value.settings.disk_options.scope

  dynamic "exclusions" {
    for_each = each.value.settings.disk_options.exclusions
    content {
      dynamic "exclusion" {
        for_each = [1]
        content {
          filesystem = exclusions.value.filesystem
          mountpoint = exclusions.value.mountpoint
          os         = exclusions.value.os
        }
      }
    }
  }
}
