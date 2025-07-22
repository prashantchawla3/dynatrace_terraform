variable "environment_name" {
  description = "Unique name of the Dynatrace environment"
  type        = string
  default     = "prod-environment"
}

variable "environment_state" {
  description = "State of the Dynatrace environment (e.g., active, paused)"
  type        = string
  default     = "active"
}

variable "environment_trial" {
  description = "Flag to indicate if the environment is a trial"
  type        = bool
  default     = false
}

variable "environment_tags" {
  description = "Set of tags assigned to the Dynatrace environment"
  type        = set(string)
  default     = ["monitoring", "cloud"]
}

variable "storage_transactions" {
  description = "Amount of transaction storage in GB"
  type        = number
  default     = 100
}

variable "storage_user_actions" {
  description = "Amount of user action storage in GB"
  type        = number
  default     = 50
}

variable "storage_limits" {
  description = "Optional limits for various storage types"
  type = object({
    logs           = optional(number)
    session_replay = optional(number)
    symbol_files   = optional(number)
    transactions   = optional(number)
  })
  default = {
    logs           = 500
    session_replay = 200
    symbol_files   = 100
    transactions   = 300
  }
}

variable "storage_retention" {
  description = "Retention durations for various data types in days"
  type = object({
    rum                   = number
    service_code_level    = number
    service_request_level = number
    session_replay        = number
    synthetic             = number
    logs                  = optional(number)
  })
  default = {
    rum                   = 30
    service_code_level    = 14
    service_request_level = 14
    session_replay        = 7
    synthetic             = 30
    logs                  = 90
  }
}

variable "quotas" {
  description = "Quota allocations for various Dynatrace capabilities"
  type = object({
    host_units = optional(number)
    ddus = optional(object({
      annual  = optional(number)
      monthly = optional(number)
    }))
    dem_units = optional(object({
      annual  = optional(number)
      monthly = optional(number)
    }))
    logs = optional(object({
      annual  = optional(number)
      monthly = optional(number)
    }))
    synthetic = optional(object({
      annual  = optional(number)
      monthly = optional(number)
    }))
    user_sessions = optional(object({
      annual  = optional(number)
      monthly = optional(number)
    }))
  })
  default = {
    host_units = 10
    ddus = {
      annual  = 12000
      monthly = 1000
    }
    dem_units = {
      annual  = 6000
      monthly = 500
    }
    logs = {
      annual  = 3000
      monthly = 250
    }
    synthetic = {
      annual  = 1200
      monthly = 100
    }
    user_sessions = {
      annual  = 24000
      monthly = 2000
    }
  }
}
