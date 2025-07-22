variable "crashdump_analytics" {
  description = "Enable crash dump analytics per host for diagnostic correlation"
  type = list(object({
    host_id                     = string
    enable_crash_dump_analytics = bool
  }))
  default = [
    { host_id = "host-01", enable_crash_dump_analytics = true }
  ]
}
