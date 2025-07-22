variable "api_token_config" {
  description = "Configuration for API token"
  type = object({
    name    = string
    enabled = bool
    scopes  = list(string)
  })
  default = {
    name    = "default-api-token"
    enabled = true
    scopes  = ["DataExport", "ReadConfig", "WriteConfig"]
  }
}