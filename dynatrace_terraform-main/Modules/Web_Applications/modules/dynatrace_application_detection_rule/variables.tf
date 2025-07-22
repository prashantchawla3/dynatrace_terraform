variable "filter_config" {
  description = "Optional filter configuration used for detection or targeting."
  type = object({
    application_match_target = string
    application_match_type   = string
    pattern                  = string
  })
  default = null
}

variable "name" {
  description = "Optional name used in rule or entity labeling."
  type        = string
  default     = null
}

variable "order" {
  description = "Optional ordering value for injection or detection logic."
  type        = string
  default     = null
}
variable "app_detection_rules" {
  description = "List of application detection rules used to associate traffic with web applications."
  type = list(object({
    id             = string
    application_id = string
    matcher        = string
    pattern        = string
    description    = optional(string)
    insert_after   = optional(string)
  }))
  default = []
}
