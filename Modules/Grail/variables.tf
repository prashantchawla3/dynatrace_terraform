variable "segments" {
  description = "List of segments to be created."
  type = list(object({
    name        = string
    description = string
    is_public   = bool
    includes    = list(object({
      data_object       = string
      filter            = string
      relationship_name = string
      relationship_target = string
    }))
  }))
}

variable "variables_type" {
  description = "Type of the variable used in the segment."
  type        = string
  default     = "query"
}

variable "variables_value" {
  description = "Value of the variable used in the segment."
  type        = string
  default     = "fetch dt.entity.kubernetes_cluster | fields cluster = entity.name | sort cluster"
}
