variable "log_buckets" {
  description = "Dynatrace log bucket definitions"
  type = map(object({
    enabled     = bool
    bucket_name = string
    matcher     = string
    rule_name   = string
  }))
  default = {}
}
