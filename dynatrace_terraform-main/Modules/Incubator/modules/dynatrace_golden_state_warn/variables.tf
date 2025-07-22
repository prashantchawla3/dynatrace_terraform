variable "warn_mode" {
  description = "Mode for the golden_state_warn resource (e.g., 'log-only', 'notify')"
  type        = string
  default     = "notify"
}

variable "warn_autotag_ids" {
  description = "List of autotag IDs used to trigger warnings"
  type        = list(string)
  default     = ["tag-expired", "tag-risky"]
}
