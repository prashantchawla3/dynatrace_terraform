variable "muted_request_names" {
  description = "List of request names to be excluded from alerting or visibility."
  type        = list(string)
  default     = []
}
variable "service_id" {
  description = "The unique ID of the Dynatrace service to which the configuration will apply."
  type        = string
  sensitive   = true
}
