variable "synthetic_availability_exclude_maintenance_windows" {
  description = "Exclude maintenance windows from availability calculations if set to true."
  type        = bool
  default     = false
}
variable "enable_synthetic_availability" {
  description = "Master switch to enable synthetic availability rules."
  type        = bool
  default     = true
}
