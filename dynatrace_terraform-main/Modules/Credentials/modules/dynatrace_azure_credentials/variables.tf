variable "azure_active" {
  description = "Whether the Azure credentials are active"
  type        = bool
  default     = true
}

variable "azure_app_id" {
  description = "Azure Application (Client) ID"
  type        = string
}

variable "azure_auto_tagging" {
  description = "Enable Azure auto-tagging"
  type        = bool
  default     = true
}

variable "azure_directory_id" {
  description = "Azure Directory (Tenant) ID"
  type        = string
}

variable "azure_label" {
  description = "Label for the Azure credentials"
  type        = string
  default     = "azure-main"
}

variable "azure_key" {
  description = "Azure Client Secret Key"
  type        = string
}

variable "azure_monitor_only_tagged_entities" {
  description = "Only monitor tagged Azure entities"
  type        = bool
  default     = false
}

variable "azure_remove_defaults" {
  description = "Remove default services from Azure monitoring"
  type        = bool
  default     = false
}

variable "azure_monitor_only_tag_pairs" {
  description = "List of Azure tags to monitor"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}
