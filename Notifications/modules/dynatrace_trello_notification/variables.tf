variable "trello_active" {
  description = "Enable Trello integration"
  type        = bool
  default     = false
}

variable "trello_name" {
  description = "Display name for Trello integration"
  type        = string
  default     = "TrelloAlerts"
}

variable "trello_application_key" {
  description = "Trello application key"
  type        = string
  sensitive   = true
  default     = ""
}

variable "trello_board_id" {
  description = "Trello board ID where card is created"
  type        = string
  default     = ""
}

variable "trello_list_id" {
  description = "Trello list ID for open alerts"
  type        = string
  default     = ""
}

variable "trello_resolved_list_id" {
  description = "Trello list ID for resolved alerts"
  type        = string
  default     = ""
}

variable "trello_text" {
  description = "Trello card title"
  type        = string
  default     = "Alert card"
}

variable "trello_description" {
  description = "Trello card description"
  type        = string
  default     = "Details from Dynatrace alert"
}

variable "trello_authorization_token" {
  description = "Authorization token for Trello API"
  type        = string
  sensitive   = true
  default     = ""
}