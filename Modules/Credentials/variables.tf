

variable "label" {
  description = "Label for AWS credentials"
  type        = string
}

variable "partition_type" {
  description = "AWS partition type (e.g., AWS_DEFAULT, AWS_CN, AWS_US_GOV)"
  type        = string
}

variable "tagged_only" {
  description = "Whether to monitor only tagged resources"
  type        = bool
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
}

variable "tags_to_monitor" {
  description = "List of AWS tags to monitor (max 10)"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "aws_services" {
  description = "AWS services to monitor with recommended metrics toggle"
  type = map(object({
    use_recommended_metrics = bool
  }))
  default = {}
}

##############################
# Azure Credential Variables
##############################

variable "azure_active" {
  description = "Activate Azure monitoring"
  type        = bool
}

variable "azure_app_id" {
  description = "Azure App ID"
  type        = string
}

variable "azure_auto_tagging" {
  description = "Enable auto-tagging for Azure resources"
  type        = bool
}

variable "azure_directory_id" {
  description = "Azure Directory ID (Tenant ID)"
  type        = string
}

variable "azure_label" {
  description = "Label for Azure credentials"
  type        = string
}

variable "azure_key" {
  description = "Azure client secret"
  type        = string
  sensitive   = true
}

variable "azure_monitor_only_tagged_entities" {
  description = "Monitor only tagged Azure resources"
  type        = bool
}

variable "azure_remove_defaults" {
  description = "Remove default Azure services added by Dynatrace"
  type        = bool
  default     = false
}

variable "azure_monitor_only_tag_pairs" {
  description = "Azure tag name-value pairs for filtering"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "azure_services" {
  description = "Azure services to monitor with recommended metrics toggle"
  type = map(object({
    use_recommended_metrics = bool
  }))
  default = {}
}

##############################
# Dynatrace Credentials
##############################

variable "credentials_name" {
  description = "Name for generic Dynatrace credentials"
  type        = string
}

variable "credentials_scopes" {
  description = "Scopes for the Dynatrace credentials"
  type        = list(string)
}

variable "credentials_username" {
  description = "Username for Dynatrace credentials"
  type        = string
}

variable "credentials_password" {
  description = "Password for Dynatrace credentials"
  type        = string
  sensitive   = true
}
