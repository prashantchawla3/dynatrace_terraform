resource "dynatrace_hub_subscriptions" "this" {
  for_each = {
    for r in var.hub_subscriptions_resources : r.name => r
    if r.settings.hub_subscriptions != null
  }

  token_subscriptions {
    token_subscription {
      name        = each.value.settings.hub_subscriptions.token_subscription.name
      description = each.value.settings.hub_subscriptions.token_subscription.description
      enabled     = each.value.settings.hub_subscriptions.token_subscription.enabled
      token       = each.value.settings.hub_subscriptions.token_subscription.token
    }
  }
}
