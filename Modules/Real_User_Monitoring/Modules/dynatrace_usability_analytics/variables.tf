variable "usability_analytics" {
  description = "Enables features like rage-click detection for user analytics."
  type = map(object({
    detect_rage_clicks = bool
    application_id     = optional(string)
  }))
  default = {
    ua1 = {
      detect_rage_clicks = true
    }
    ua2 = {
      detect_rage_clicks = false
      application_id     = "APPLICATION-EA7C4B59F27D43EB"
    }
  }
}