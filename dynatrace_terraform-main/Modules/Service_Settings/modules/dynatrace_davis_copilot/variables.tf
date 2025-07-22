variable "enable_copilot" {
  description = "Enable Davis CoPilot for automated problem resolution and insights"
  type        = bool
  default     = true
}

variable "enable_tenant_aware_data_mining" {
  description = "Enable tenant-specific data mining for AI-driven root cause detection"
  type        = bool
  default     = true
}

variable "blocklist_name" {
  description = "Name identifier for the blocklist entry used to exclude specific buckets or tables"
  type        = string
  default     = "sensitive-data-block"
}

variable "blocklist_type" {
  description = "Type of the blocklist target (e.g., BUCKET, TABLE) used for exclusion"
  type        = string
  default     = "TABLE"
}
