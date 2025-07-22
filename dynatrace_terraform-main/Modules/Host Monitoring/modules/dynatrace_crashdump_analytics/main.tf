resource "dynatrace_crashdump_analytics" "example" {
  count                         = length(var.crashdump_analytics)
  host_id                       = var.crashdump_analytics[count.index].host_id
  enable_crash_dump_analytics  = var.crashdump_analytics[count.index].enable_crash_dump_analytics
}
