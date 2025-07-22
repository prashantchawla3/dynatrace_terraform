variable "msteams_connections" {
  description = "List of Microsoft Teams connection configs."
  type = list(object({
    name         = string
    webhook      = string
    team_name    = optional(string)
    channel_name = optional(string)
  }))
  sensitive = true
}
