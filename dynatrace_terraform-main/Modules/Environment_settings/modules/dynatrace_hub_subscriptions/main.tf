resource "dynatrace_hub_subscriptions" "this" {
  for_each = {
    for r in var.resources : r.name => r
    if r.type == "hub_subscriptions" && r.settings.hub_subscriptions != null
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
