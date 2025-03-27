variable "aws_label" {
  description = "The name of the AWS credentials"
  type        = string
}

variable "aws_partition_type" {
  description = "The type of the AWS partition"
  type        = string
  default     = "AWS_DEFAULT"
}

variable "aws_tagged_only" {
  description = "Monitor only resources which have specified AWS tags (true) or all resources (false)"
  type        = bool
  default     = false
}

variable "aws_account_id" {
  description = "The ID of the Amazon account"
  type        = string
}

variable "aws_iam_role" {
  description = "The IAM role to be used by Dynatrace to get monitoring data"
  type        = string
}

variable "aws_remove_defaults" {
  description = "Instructs the provider to remove the supporting services Dynatrace applies by default to newly created AWS Credentials"
  type        = bool
  default     = true
}

variable "aws_services" {
  description = "A map of AWS services to be monitored"
  type        = map(object({
    use_recommended_metrics = bool
  }))
  default = {}
}

variable "azure_active" {
  description = "The monitoring is enabled (true) or disabled (false)"
  type        = bool
  default     = true
}

variable "azure_app_id" {
  description = "The Application ID (also referred to as Client ID)"
  type        = string
}

variable "azure_auto_tagging" {
  description = "The automatic capture of Azure tags is on (true) or off (false)"
  type        = bool
  default     = true
}

variable "azure_directory_id" {
  description = "The Directory ID (also referred to as Tenant ID)"
  type        = string
}

variable "azure_label" {
  description = "The unique name of the Azure credentials configuration"
  type        = string
}

variable "azure_key" {
  description = "The secret key associated with the Application ID"
  type        = string
  sensitive   = true
}

variable "azure_monitor_only_tagged_entities" {
  description = "Monitor only resources that have specified Azure tags (true) or all resources (false)"
  type        = bool
  default     = true
}

variable "azure_monitor_only_tag_pairs" {
  description = "A list of Azure tags to be monitored"
  type        = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "azure_remove_defaults" {
  description = "Instructs the provider to remove the supporting services Dynatrace applies by default to newly created Azure Credentials"
  type        = bool
  default     = true
}

variable "azure_services" {
  description = "A map of Azure services to be monitored"
  type        = map(object({
    use_recommended_metrics = bool
  }))
  default = {}
}

variable "credentials_name" {
  description = "The name of the credentials set"
  type        = string
}

variable "credentials_scopes" {
  description = "The set of scopes of the credentials set"
  type        = list(string)
  default     = ["SYNTHETIC"]
}

variable "credentials_username" {
  description = "The username of the credentials set"
  type        = string
  sensitive   = true
}

variable "credentials_password" {
  description = "The password of the credential"
  type        = string
  sensitive   = true
}
