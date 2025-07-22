variable "aix_extensions" {
  description = "Enable or disable Dynatrace AIX monitoring extensions per host"
  type = list(object({
    host_id             = string
    use_global_settings = bool
    enabled             = bool
  }))
  default = [
    { host_id = "host-aix-01", use_global_settings = true, enabled = true }
  ]
}
