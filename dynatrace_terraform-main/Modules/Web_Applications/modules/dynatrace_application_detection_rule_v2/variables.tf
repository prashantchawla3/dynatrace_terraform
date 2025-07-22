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
