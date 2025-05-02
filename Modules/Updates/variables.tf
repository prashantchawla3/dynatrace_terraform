
variable "environment_url" { type = string }
variable "dynatrace_client_id" { type = string }
variable "dynatrace_client_secret" { type = string, sensitive = true }

variable "auto_update" { description = "Enable ActiveGate auto update"; type = bool }
variable "scope_activegate" { description = "Scope for ActiveGate updates"; type = string }
variable "scope_oneagent" { description = "Scope for OneAgent updates"; type = string }
variable "target_version" { description = "Target OneAgent version"; type = string }
variable "update_mode" { description = "OneAgent update mode"; type = string }

variable "name" { description = "Update window name"; type = string }
variable "enabled" { description = "Enable update window"; type = bool }
variable "recurrence" { description = "Recurrence type"; type = string }
variable "once_recurrence_end" { description = "One-time window end"; type = string }
variable "once_recurrence_start" { description = "One-time window start"; type = string }
