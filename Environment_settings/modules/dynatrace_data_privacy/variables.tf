variable "data_privacy_resources" {
  description = "Data privacy settings including masking and tracking controls."
  type = list(object({
    name     = string
    type     = string
    settings = object({
      data_privacy = object({
        application_id = string
        data_collection = object({
          opt_in_mode_enabled = bool
        })
        do_not_track = object({
          comply_with_do_not_track = bool
        })
        masking = object({
          personal_data_uri_masking_enabled = bool
          user_action_masking_enabled       = bool
        })
        user_tracking = object({
          persistent_cookie_enabled = bool
        })
      })
    })
  }))
  default = []
}
