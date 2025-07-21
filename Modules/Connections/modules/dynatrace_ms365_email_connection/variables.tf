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
  default = [
    {
      name          = "ms365-main"
      client_id     = "client-id-123"
      tenant_id     = "tenant-id-456"
      from_address  = "noreply@example.com"
      type          = "client_secret"
      client_secret = "ms365-secret"
    }
  ]
}
