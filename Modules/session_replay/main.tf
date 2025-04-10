resource "dynatrace_session_replay_resource_capture" "example" {
  application_id                              = var.application_id
  enable_resource_capturing                   = var.enable_resource_capturing
  resource_capture_url_exclusion_pattern_list = var.resource_capture_url_exclusion_pattern_list
}

resource "dynatrace_session_replay_web_privacy" "example" {
  application_id             = var.application_id
  enable_opt_in_mode         = var.enable_opt_in_mode
  url_exclusion_pattern_list = var.url_exclusion_pattern_list
  masking_presets {
    playback_masking_preset  = var.playback_masking_preset
    recording_masking_preset = var.recording_masking_preset
    recording_masking_allow_list_rules {
      allow_list_rule {
        css_expression = var.recording_masking_allow_list_rules_css_expression
        target         = var.recording_masking_allow_list_rules_target
      }
    }
  }
}
