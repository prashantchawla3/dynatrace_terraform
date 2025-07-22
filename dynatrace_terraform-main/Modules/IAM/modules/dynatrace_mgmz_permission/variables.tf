variable "mgmz_permission_group" {
  description = "Group for management zone permission"
  type        = string
  default     = "observability-squad"
}

variable "mgmz_permission_environment" {
  description = "Environment for management zone permission"
  type        = string
  default     = "env:production"
}

variable "mgmz_permission_management_zone" {
  description = "Management zone for permission"
  type        = string
  default     = "prod-zone"
}

variable "mgmz_permission_permissions" {
  description = "Permissions for the management zone"
  type        = list(string)
  default     = ["view", "edit", "configure"]
}
