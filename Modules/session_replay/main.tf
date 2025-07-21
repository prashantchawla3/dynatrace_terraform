
# ─── Session Replay: Resource Capture ─────────────────────
module "resource_capture" {
  source = "./modules/dynatrace_session_replay_resource_capture"

  application_id                              = var.application_id
  enable_resource_capturing                   = var.enable_resource_capturing
  resource_capture_url_exclusion_pattern_list = var.resource_capture_url_exclusion_pattern_list
}

# ─── Session Replay: Web Privacy & Masking ───────────────
module "web_privacy" {
  source = "./modules/dynatrace_session_replay_web_privacy"

  application_id                           = var.application_id
  enable_opt_in_mode                       = var.enable_opt_in_mode
  url_exclusion_pattern_list              = var.url_exclusion_pattern_list
  playback_masking_preset                 = var.playback_masking_preset
  recording_masking_preset                = var.recording_masking_preset
  recording_masking_allow_list_rules      = var.recording_masking_allow_list_rules
}
