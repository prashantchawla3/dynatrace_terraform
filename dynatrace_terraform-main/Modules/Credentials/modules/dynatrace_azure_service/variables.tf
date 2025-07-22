variable "azure_services" {
  description = "Azure services to monitor with recommended metrics toggle"
  type = map(object({
    use_recommended_metrics = bool
  }))
  default = {
    azure_virtual_machines = { use_recommended_metrics = true }
    azure_functions        = { use_recommended_metrics = false }
  }
}
