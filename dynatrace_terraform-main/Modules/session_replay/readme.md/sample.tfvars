
application_id = "environment"
enable_resource_capturing = true
resource_capture_url_exclusion_pattern_list = ["www.google.com"]
enable_opt_in_mode = false
url_exclusion_pattern_list = ["www.google.com"]
playback_masking_preset = "MASK_ALL"
recording_masking_preset = "ALLOW_LIST"
recording_masking_allow_list_rules = [
  {
    css_expression = "selector.example"
    target         = "ELEMENT"
  }
]
