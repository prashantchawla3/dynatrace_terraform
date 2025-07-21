resource "dynatrace_geolocation" "this" {
  for_each = var.geolocation
  display_worldmap = each.value.display_worldmap
  scope            = each.value.scope
}

resource "dynatrace_process_group_rum" "this" {
  for_each = var.process_group_rum
  enable           = each.value.enable
  process_group_id = each.value.process_group_id
}

resource "dynatrace_rum_advanced_correlation" "this" {
  for_each = var.rum_advanced_correlation
  matcher  = each.value.matcher
  pattern  = each.value.pattern
}

resource "dynatrace_rum_host_headers" "this" {
  for_each = var.rum_host_headers
  header_name = each.value.header_name
}

resource "dynatrace_rum_ip_determination" "this" {
  for_each = var.rum_ip_determination
  header_name = each.value.header_name
}

resource "dynatrace_rum_ip_locations" "this" {
  for_each = var.rum_ip_locations
  country_code = each.value.country_code
  ip           = each.value.ip
  ip_to        = each.value.ip_to
  region_code  = each.value.region_code
}

resource "dynatrace_rum_overload_prevention" "this" {
  for_each = var.rum_overload_prevention
  overload_prevention_limit = each.value.overload_prevention_limit
}

resource "dynatrace_rum_provider_breakdown" "this" {
  for_each = var.rum_provider_breakdown
  report_public_improvement = each.value.report_public_improvement
  resource_name             = each.value.resource_name
  resource_type             = each.value.resource_type

  dynamic "domain_name_pattern_list" {
    for_each = each.value.domain_name_pattern_list
    content {
      dynamic "domain_name_pattern" {
        for_each = domain_name_pattern_list.value.domain_name_pattern
        content {
          pattern = domain_name_pattern.value.pattern
        }
      }
    }
  }
}

resource "dynatrace_usability_analytics" "this" {
  for_each = var.usability_analytics
  detect_rage_clicks = each.value.detect_rage_clicks
  application_id     = lookup(each.value, "application_id", null)
}

resource "dynatrace_user_action_metrics" "this" {
  for_each = var.user_action_metrics
  enabled     = each.value.enabled
  dimensions  = each.value.dimensions
  metric_key  = each.value.metric_key

  dynamic "filters" {
    for_each = each.value.filters
    content {
      dynamic "filter" {
        for_each = filters.value.filter
        content {
          field_name = filter.value.field_name
          operator   = filter.value.operator
          value      = filter.value.value
        }
      }
    }
  }

  value {
    type = each.value.value.type
  }
}

resource "dynatrace_user_experience_score" "this" {
  for_each = var.user_experience_score
  consider_last_action                   = each.value.consider_last_action
  consider_rage_click                    = each.value.consider_rage_click
  max_frustrated_user_actions_threshold = each.value.max_frustrated_user_actions_threshold
  min_satisfied_user_actions_threshold  = each.value.min_satisfied_user_actions_threshold
}

resource "dynatrace_user_session_metrics" "this" {
  for_each = var.user_session_metrics
  enabled    = each.value.enabled
  metric_key = each.value.metric_key

  dynamic "filters" {
    for_each = each.value.filters
    content {
      dynamic "filter" {
        for_each = filters.value.filter
        content {
          field_name = filter.value.field_name
          operator   = filter.value.operator
          value      = filter.value.value
        }
      }
    }
  }

  value {
    type = each.value.value.type
  }
}
