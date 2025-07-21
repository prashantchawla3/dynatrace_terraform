variable "pg_simple_detections" {
  description = "Simple detection configurations based on group and instance identifiers."
  type = map(object({
    enabled             = bool
    group_identifier    = string
    instance_identifier = string
    process_type        = string
    rule_type           = string
  }))
  default = {
    simple1 = {
      enabled             = false
      group_identifier    = "GroupIdentifierExample"
      instance_identifier = "InstanceIdentifierExample"
      process_type        = "PROCESS_TYPE_GO"
      rule_type           = "prop"
    }
  }
}
