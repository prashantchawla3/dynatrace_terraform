variable "ruxit_monitors_ruxit" {
  description = "Enable monitoring of Ruxit services"
  type        = bool
  default     = true
}

variable "support_send_billing" {
  description = "Allow sending billing-related data to Dynatrace support"
  type        = bool
  default     = true
}

variable "support_send_cluster_health" {
  description = "Allow sending cluster health data to Dynatrace support"
  type        = bool
  default     = true
}

variable "suppress_non_billing_relevant_data" {
  description = "Suppress data that is not relevant for billing"
  type        = bool
  default     = false
}

variable "certificate_management_enabled" {
  description = "Enable certificate management"
  type        = bool
  default     = true
}

variable "certificate_management_possible" {
  description = "Indicates whether certificate management is possible"
  type        = bool
  default     = true
}

variable "community_create_user" {
  description = "Allow creation of community user accounts"
  type        = bool
  default     = true
}

variable "community_external_search" {
  description = "Enable external search in the Dynatrace community"
  type        = bool
  default     = true
}

variable "help_chat_enabled" {
  description = "Enable help chat feature"
  type        = bool
  default     = true
}

variable "read_only_remote_access_allowed" {
  description = "Allow read-only remote access to the cluster"
  type        = bool
  default     = false
}

variable "remote_access_on_demand_only" {
  description = "Restrict remote access to on-demand only"
  type        = bool
  default     = true
}

variable "support_allow_remote_access" {
  description = "Allow Dynatrace support to access the cluster remotely"
  type        = bool
  default     = true
}

variable "support_send_events" {
  description = "Allow sending event data to Dynatrace support"
  type        = bool
  default     = true
}

variable "telemetry_sharing" {
  description = "Enable sharing of telemetry data with Dynatrace"
  type        = bool
  default     = true
}
