output "data_privacy_settings" {
  value = [
    for r in var.data_privacy_resources : {
      application_id              = r.settings.data_privacy.application_id
      opt_in_mode_enabled         = r.settings.data_privacy.data_collection.opt_in_mode_enabled
      comply_with_do_not_track    = r.settings.data_privacy.do_not_track.comply_with_do_not_track
      uri_masking_enabled         = r.settings.data_privacy.masking.personal_data_uri_masking_enabled
      user_action_masking_enabled = r.settings.data_privacy.masking.user_action_masking_enabled
      persistent_cookie_enabled   = r.settings.data_privacy.user_tracking.persistent_cookie_enabled
    }
  ]
}