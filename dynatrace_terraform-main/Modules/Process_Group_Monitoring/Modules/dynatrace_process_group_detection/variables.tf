variable "pg_detections" {
  description = "Detection rules for identifying process groups based on arguments and metadata."
  type = map(object({
    enabled                  = bool
    group_property           = string
    group_standalone_rule   = bool
    group_remove_ids         = bool
    instance_property        = string
    instance_remove_ids      = bool
    contained_string         = string
    process_property         = string
    restrict_to_process_type = string
  }))
  default = {
    detection1 = {
      enabled                 = true
      group_property          = "COMMAND_LINE_ARGS"
      group_standalone_rule  = false
      group_remove_ids        = true
      instance_property       = "AWS_ECS_FAMILY"
      instance_remove_ids     = true
      contained_string        = "-config"
      process_property        = "COMMAND_LINE_ARGS"
      restrict_to_process_type = "PROCESS_TYPE_APACHE_HTTPD"
    }
  }
}
