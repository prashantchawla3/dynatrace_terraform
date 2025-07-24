output "hub_subscription_tokens" {
  value = [
    for r in var.hub_subscriptions_resources : {
      name        = r.settings.hub_subscriptions.token_subscription.name
      description = r.settings.hub_subscriptions.token_subscription.description
      enabled     = r.settings.hub_subscriptions.token_subscription.enabled
      token       = r.settings.hub_subscriptions.token_subscription.token
    }
  ]
}
