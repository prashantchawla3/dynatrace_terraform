variable "rum_provider_breakdown" {
  description = "Reports RUM data for third-party resources and public improvement options."
  type = map(object({
    report_public_improvement = bool
    resource_name             = string
    resource_type             = string
    domain_name_pattern_list  = list(object({
      domain_name_pattern = list(object({
        pattern = string
      }))
    }))
  }))
  default = {
    rpb1 = {
      report_public_improvement = false
      resource_name             = "example"
      resource_type             = "ThirdParty"
      domain_name_pattern_list  = [
        {
          domain_name_pattern = [
            { pattern = "Terraform3rdPartyExample.com" }
          ]
        }
      ]
    }
  }
}
