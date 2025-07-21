variable "default_launchpads" {
  description = "Mapping of launchpad presets grouped by team or user group. Each launchpad entry includes visibility state, launchpad ID, and associated group."
  type = map(object({
    group_launchpads = list(object({
      is_enabled    = bool
      launchpad_id  = string
      user_group_id = string
    }))
  }))
  default = {
    operations = {
      group_launchpads = [
        { is_enabled = true,  launchpad_id = "lp-001", user_group_id = "ops-group" },
        { is_enabled = false, launchpad_id = "lp-002", user_group_id = "legacy-group" }
      ]
    },
    engineering = {
      group_launchpads = [
        { is_enabled = true, launchpad_id = "lp-003", user_group_id = "eng-group" }
      ]
    }
  }
}
