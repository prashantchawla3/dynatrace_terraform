variable "msentraid_connections" {
  description = "List of Microsoft Entra ID (formerly Azure AD) connection configs."
  type = list(object({
    name            = string
    application_id  = string
    directory_id    = string
    client_secret   = string
    description     = optional(string)
  }))
  default = [
    {
      name            = "entra-main"
      application_id  = "app-id-789"
      directory_id    = "dir-id-012"
      client_secret   = "entra-secret"
      description     = "Azure AD app for SSO"
    }
  ]
}
