variable "segment_name" {
  description = "Name of the Dynatrace segment"
  type        = string
  default     = "default-segment"
}

variable "segment_description" {
  description = "Description of the Dynatrace segment"
  type        = string
  default     = "Segment used for targeting monitoring scope based on custom query"
}

variable "segment_is_public" {
  description = "Whether the segment is publicly visible in Dynatrace"
  type        = bool
  default     = false
}

variable "segment_query" {
  description = "Query expression used for variable filtering in the segment"
  type        = string
  default     = "type == SERVICE AND tag('team:sre')"
}

variable "includes_items" {
  description = "List of included items in the segment configuration block, with optional relationship metadata"
  type = list(object({
    data_object = string
    filter      = string
    relationship = optional(object({
      name   = string
      target = string
    }))
  }))
  default = [
    {
      data_object = "SERVICE"
      filter      = "tag('critical')"
      relationship = {
        name   = "depends_on"
        target = "HOST"
      }
    },
    {
      data_object = "HOST"
      filter      = "tag('region:eu')"
      relationship = null
    }
  ]
}
