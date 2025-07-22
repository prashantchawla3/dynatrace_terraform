resource "dynatrace_environment" "this" {
  name   = var.environment_name
  state  = var.environment_state
  trial  = var.environment_trial
  tags   = var.environment_tags

  storage {
    transactions = var.storage_transactions
    user_actions = var.storage_user_actions

    dynamic "limits" {
      for_each = var.storage_limits != null ? [var.storage_limits] : []
      content {
        logs           = lookup(limits.value, "logs", null)
        session_replay = lookup(limits.value, "session_replay", null)
        symbol_files   = lookup(limits.value, "symbol_files", null)
        transactions   = lookup(limits.value, "transactions", null)
      }
    }

    dynamic "retention" {
      for_each = var.storage_retention != null ? [var.storage_retention] : []
      content {
        rum                   = retention.value.rum
        service_code_level    = retention.value.service_code_level
        service_request_level = retention.value.service_request_level
        session_replay        = retention.value.session_replay
        synthetic             = retention.value.synthetic
        logs                  = lookup(retention.value, "logs", null)
      }
    }
  }

  dynamic "quotas" {
    for_each = var.quotas != null ? [var.quotas] : []
    content {
      host_units = lookup(quotas.value, "host_units", null)

      dynamic "ddus" {
        for_each = lookup(quotas.value, "ddus", null) != null ? [quotas.value.ddus] : []
        content {
          annual  = lookup(ddus.value, "annual", null)
          monthly = lookup(ddus.value, "monthly", null)
        }
      }

      dynamic "dem_units" {
        for_each = lookup(quotas.value, "dem_units", null) != null ? [quotas.value.dem_units] : []
        content {
          annual  = lookup(dem_units.value, "annual", null)
          monthly = lookup(dem_units.value, "monthly", null)
        }
      }

      dynamic "logs" {
        for_each = lookup(quotas.value, "logs", null) != null ? [quotas.value.logs] : []
        content {
          annual  = lookup(logs.value, "annual", null)
          monthly = lookup(logs.value, "monthly", null)
        }
      }

      dynamic "synthetic" {
        for_each = lookup(quotas.value, "synthetic", null) != null ? [quotas.value.synthetic] : []
        content {
          annual  = lookup(synthetic.value, "annual", null)
          monthly = lookup(synthetic.value, "monthly", null)
        }
      }

      dynamic "user_sessions" {
        for_each = lookup(quotas.value, "user_sessions", null) != null ? [quotas.value.user_sessions] : []
        content {
          annual  = lookup(user_sessions.value, "annual", null)
          monthly = lookup(user_sessions.value, "monthly", null)
        }
      }
    }
  }
}
