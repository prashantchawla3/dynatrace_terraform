variable "unified_services_metrics" {
  description = "Enablement flags for ingesting endpoint metrics per unified service ID."
  type = list(object({
    enable_endpoint_metrics = bool
    service_id              = string
  }))
  default = []
}
