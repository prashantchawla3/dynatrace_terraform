variable "process_group_rum" {
  description = "Configures Real User Monitoring (RUM) for specified process groups."
  type = map(object({
    enable           = bool
    process_group_id = string
  }))
  default = {
    pgr1 = {
      enable           = false
      process_group_id = "PROCESS_GROUP-1234567890000000"
    }
  }
}