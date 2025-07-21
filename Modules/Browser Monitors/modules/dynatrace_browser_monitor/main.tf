resource "dynatrace_browser_monitor" "monitor" {
  for_each = { for bm in var.browser_monitors : bm.name => bm }

  name      = each.key
  enabled   = lookup(each.value, "enabled", true)
  frequency = each.value.frequency
  locations = lookup(each.value, "locations", [])

  key_performance_metrics {
    load_action_kpm = lookup(each.value, "load_action_kpm", "VISUALLY_COMPLETE")
    xhr_action_kpm  = lookup(each.value, "xhr_action_kpm", "RESPONSE_END")
  }

  script {
    type = "clickpath"

    events {
      dynamic "event" {
        for_each = each.value.script_events
        content {
          description = event.value.description

          dynamic "navigate" {
            for_each = event.value.navigate != null ? [event.value.navigate] : []
            content {
              url = navigate.value.url
            }
          }

          dynamic "click" {
            for_each = event.value.click != null ? [event.value.click] : []
            content {
              target {
                locators {
                  locator {
                    type  = click.value.target.locators[0].type
                    value = click.value.target.locators[0].value
                  }
                }
              }
              button = click.value.button
            }
          }

          dynamic "keystrokes" {
            for_each = event.value.keystrokes != null ? [event.value.keystrokes] : []
            content {
              text = keystrokes.value.text
              target {
                locators {
                  locator {
                    type  = keystrokes.value.target.locators[0].type
                    value = keystrokes.value.target.locators[0].value
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}