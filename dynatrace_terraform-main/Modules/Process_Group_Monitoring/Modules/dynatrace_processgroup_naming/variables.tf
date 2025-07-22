variable "pg_namings" {
  description = "Rules for naming process groups based on various conditions and string matches."
  type = map(object({
    enabled  = bool
    format   = string
    conditions = list(object({
      key_type        = string
      key_attribute   = string
      tech_negate     = bool
      tech_operator   = string
      tech_value_type = string
    }))
    string_conditions = list(object({
      attribute      = string
      dynamic_key    = string
      case_sensitive = bool
      negate         = bool
      operator       = string
      value          = string
    }))
  }))
  default = {
    naming1 = {
      enabled = true
      format  = "{ProcessGroup:DetectedName} {ProcessGroup:CommandLineArgs}"
      conditions = [
        {
          key_type        = "STATIC"
          key_attribute   = "PROCESS_GROUP_TECHNOLOGY"
          tech_negate     = false
          tech_operator   = "EQUALS"
          tech_value_type = "ADO_NET"
        }
      ]
      string_conditions = [
        {
          attribute      = "PROCESS_GROUP_PREDEFINED_METADATA"
          dynamic_key    = "COMMAND_LINE_ARGS"
          case_sensitive = true
          negate         = false
          operator       = "CONTAINS"
          value          = "-config"
        }
      ]
    }
  }
}
