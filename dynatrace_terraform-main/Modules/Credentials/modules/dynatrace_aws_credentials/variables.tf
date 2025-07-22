variable "label" {
  description = "Label for AWS credentials"
  type        = string
  default     = "aws-main"
}

variable "partition_type" {
  description = "AWS partition type (e.g., AWS_DEFAULT, AWS_CN, AWS_US_GOV)"
  type        = string
  default     = "AWS_DEFAULT"
}

variable "tagged_only" {
  description = "Whether to monitor only tagged resources"
  type        = bool
  default     = false
}

variable "credentials_enabled" {
  description = "Enable monitoring for this AWS credential"
  type        = bool
  default     = true
}

variable "remove_defaults" {
  description = "Remove default supporting services added by Dynatrace"
  type        = bool
  default     = false
}

variable "running_on_dynatrace_infrastructure" {
  description = "Run on Dynatrace-managed infrastructure"
  type        = bool
  default     = false
}

variable "authentication_data" {
  description = "AWS authentication details"
  type = object({
    account_id = string
    iam_role   = string
    access_key = optional(string)
    secret_key = optional(string)
  })
  default = {
    account_id = "123456789012"
    iam_role   = "DynatraceMonitoringRole"
    access_key = null
    secret_key = null
  }
}

variable "tags_to_monitor" {
  description = "List of AWS tags to monitor (max 10)"
  type = list(object({
    name  = string
    value = string
  }))
  default = [
    { name = "Environment", value = "Prod" }
  ]
}
