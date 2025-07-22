variable "rum_overload_prevention" {
  description = "Sets thresholds to prevent RUM overload."
  type = map(object({
    overload_prevention_limit = number
  }))
  default = {
    rop1 = {
      overload_prevention_limit = 4000
    }
  }
}