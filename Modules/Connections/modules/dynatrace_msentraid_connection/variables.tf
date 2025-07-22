variable "msentraid_connections" {
  description = "List of Microsoft Entra ID (formerly Azure AD) connection configs."
  type = list(object({
    name           = string
    application_id = string
    directory_id   = string
    client_secret  = string
    description    = optional(string)
  }))
  sensitive = true
}
