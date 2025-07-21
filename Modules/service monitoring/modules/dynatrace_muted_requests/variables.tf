variable "muted_request_names" {
  description = "List of request names to be excluded from alerting or visibility."
  type        = list(string)
  default     = []
}
