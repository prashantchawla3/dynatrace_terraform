variable "ms365_email_connections" {
  description = "List of Microsoft 365 email connection configs."
  type = list(object({
    name          = string
    client_id     = string
    tenant_id     = string
    from_address  = string
    type          = string
    client_secret = string
  }))
  sensitive = true
}
