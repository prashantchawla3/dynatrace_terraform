variable "rum_advanced_correlation" {
  description = "Sets advanced correlation rules for RUM using matchers and patterns."
  type = map(object({
    matcher = string
    pattern = string
  }))
  default = {
    rac1 = {
      matcher = "STARTS_WITH"
      pattern = "Server-Timing-Terraform-2"
    }
  }
}