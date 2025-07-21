variable "hub_subscriptions_resources" {
  description = "Hub subscription tokens used for integrations."
  type = list(object({
    name     = string
    type     = string
    settings = object({
      hub_subscriptions = object({
        token_subscription = object({
          name        = string
          description = string
          enabled     = bool
          token       = string
        })
      })
    })
  }))
  default = []
}
