resource "dynatrace_data_privacy" "this" {
  for_each = {
    for r in var.resources : r.name => r
    if r.type == "data_privacy" && r.settings.data_privacy != null
  }

  application_id = each.value.settings.data_privacy.application_id

  data_collection {
    opt_in_mode_enabled = each.value.settings.data_privacy.data_collection.opt_in_mode_enabled
  }

  do_not_track {
    comply_with_do_not_track = each.value.settings.data_privacy.do_not_track.comply_with_do_not_track
  }

  masking {
    personal_data_uri_masking_enabled = each.value.settings.data_privacy.masking.personal_data_uri_masking_enabled
    user_action_masking_enabled       = each.value.settings.data_privacy.masking.user_action_masking_enabled
  }

  user_tracking {
    persistent_cookie_enabled = each.value.settings.data_privacy.user_tracking.persistent_cookie_enabled
  }
}
