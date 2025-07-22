variable "enable_logs" {
  description = "Toggle to enable log ingestion and processing"
  type        = bool
  default     = true
}

variable "logs_pipelines" {
  description = "List of log pipelines enabled for processing structured or unstructured logs"
  type = list(object({
    enabled      = bool
    display_name = string
    id           = string
  }))
  default = [
    {
      enabled      = true
      display_name = "App Logs Parser"
      id           = "logs-app-core"
    }
  ]
}
