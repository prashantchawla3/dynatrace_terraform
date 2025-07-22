variable "ag_token_config" {
  description = "Configuration for AG token"
  type = object({
    type            = string
    expiration_date = string
    name            = string
  })
  default = {
    type            = "AG"
    expiration_date = "2025-12-31"
    name            = "default-ag-token"
  }
}