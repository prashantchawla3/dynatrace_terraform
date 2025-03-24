variable "browser_monitor_name" {
  description = "The name of the browser monitor"
  type        = string
  default     = "#name#"
}

variable "browser_monitor_frequency" {
  description = "The frequency of the browser monitor"
  type        = number
  default     = 15
}

variable "browser_monitor_locations" {
  description = "The locations of the browser monitor"
  type        = list(string)
  default     = ["GEOLOCATION-B4B9167CAAA88F6A", "GEOLOCATION-03E96F97A389F96A"]
}

variable "browser_monitor_manually_assigned_apps" {
  description = "The manually assigned applications for the browser monitor"
  type        = list(string)
  default     = ["APPLICATION-EA7C4B59F27D43EB"]
}

variable "browser_monitor_loading_time_thresholds_enabled" {
  description = "Enable loading time thresholds for the browser monitor"
  type        = bool
  default     = true
}

variable "browser_monitor_outage_handling_global_outage" {
  description = "Enable global outage handling for the browser monitor"
  type        = bool
  default     = true
}

variable "browser_monitor_outage_handling_retry_on_error" {
  description = "Enable retry on error for the browser monitor"
  type        = bool
  default     = true
}

variable "browser_monitor_outage_handling_global_outage_policy_consecutive_runs" {
  description = "The number of consecutive runs for global outage policy"
  type        = number
  default     = 1
}

variable "browser_monitor_load_action_kpm" {
  description = "The key performance metric for load actions"
  type        = string
  default     = "VISUALLY_COMPLETE"
}

variable "browser_monitor_xhr_action_kpm" {
  description = "The key performance metric for XHR actions"
  type        = string
  default     = "VISUALLY_COMPLETE"
}

variable "browser_monitor_script_type" {
  description = "The type of the browser monitor script"
  type        = string
  default     = "clickpath"
}

variable "browser_monitor_script_configuration_bypass_csp" {
  description = "Bypass CSP for the browser monitor script"
  type        = bool
  default     = true
}

variable "browser_monitor_script_configuration_user_agent" {
  description = "The user agent for the browser monitor script"
  type        = string
  default     = "Mozilla"
}

variable "browser_monitor_script_configuration_bandwidth_network_type" {
  description = "The network type for the browser monitor script bandwidth"
  type        = string
  default     = "GPRS"
}

variable "browser_monitor_script_configuration_device_name" {
  description = "The device name for the browser monitor script"
  type        = string
  default     = "Apple iPhone 8"
}

variable "browser_monitor_script_configuration_device_orientation" {
  description = "The device orientation for the browser monitor script"
  type        = string
  default     = "landscape"
}

variable "browser_monitor_script_configuration_headers_name" {
  description = "The name of the header for the browser monitor script"
  type        = string
  default     = "kjh"
}

variable "browser_monitor_script_configuration_headers_value" {
  description = "The value of the header for the browser monitor script"
  type        = string
  default     = "kjh"
}

variable "browser_monitor_script_configuration_ignored_error_codes_status_codes" {
  description = "The status codes to ignore for the browser monitor script"
  type        = string
  default     = "400"
}

variable "browser_monitor_script_configuration_javascript_settings_timeout_settings_action_limit" {
  description = "The action limit for the browser monitor script"
  type        = number
  default     = 3
}

variable "browser_monitor_script_configuration_javascript_settings_timeout_settings_total_timeout" {
  description = "The total timeout for the browser monitor script"
  type        = number
  default     = 100
}

variable "browser_monitor_script_configuration_javascript_settings_visually_complete_options_image_size_threshold" {
  description = "The image size threshold for visually complete options"
  type        = number
  default     = 0
}

variable "browser_monitor_script_configuration_javascript_settings_visually_complete_options_inactivity_timeout" {
  description = "The inactivity timeout for visually complete options"
  type        = number
  default     = 0
}

variable "browser_monitor_script_configuration_javascript_settings_visually_complete_options_mutation_timeout" {
  description = "The mutation timeout for visually complete options"
  type        = number
  default     = 0
}

variable "browser_monitor_script_events_description" {
  description = "The description of the browser monitor script event"
  type        = string
  default     = "Loading of \"https://www.orf.at\""
}

variable "browser_monitor_script_events_navigate_url" {
  description = "The URL to navigate to in the browser monitor script event"
  type        = string
  default     = "https://www.orf.at"
}

variable "browser_monitor_script_events_navigate_authentication_type" {
  description = "The authentication type for the browser monitor script event"
  type        = string
  default     = "http_authentication"
}

variable "browser_monitor_script_events_navigate_authentication_creds" {
  description = "The credentials for the browser monitor script event"
  type        = string
  default     = "CREDENTIALS_VAULT-26F62024BC3ABBCF"
}

variable "browser_monitor_script_events_navigate_wait_wait_for" {
  description = "The wait condition for the browser monitor script event"
  type        = string
  default     = "page_complete"
}

variable "browser_monitor_script_events_description_2" {
  description = "The description of the second browser monitor script event"
  type        = string
  default     = "jhjhjh"
}

variable "browser_monitor_script_events_navigate_url_2" {
  description = "The URL to navigate to in the second browser monitor script event"
  type        = string
  default     = "https://www.orf.at"
}

variable "browser_monitor_script_events_navigate_authentication_type_2" {
  description = "The authentication type for the second browser monitor script event"
  type        = string
  default     = "http_authentication"
}

variable "browser_monitor_script_events_navigate_authentication_creds_2" {
  description = "The credentials for the second browser monitor script event"
  type        = string
  default     = "CREDENTIALS_VAULT-26F62024BC3ABBCF"
}

variable "browser_monitor_script_events_navigate_validate_validation_type" {
  description = "The validation type for the second browser monitor script event"
  type        = string
  default     = "text_match"
}

variable "browser_monitor_script_events_navigate_validate_validation_match" {
  description = "The validation match for the second browser monitor script event"
  type        = string
  default     = "kkl"
}

variable "browser_monitor_script_events_navigate_validate_validation_regex" {
  description = "The validation regex for the second browser monitor script event"
  type        = bool
  default     = true
}

variable "browser_monitor_script_events_navigate_validate_validation_target_window" {
  description = "The validation target window for the second browser monitor script event"
  type        = string
  default     = "k"
}

variable "browser_monitor_script_events_navigate_wait_timeout" {
  description = "The wait timeout for the second browser monitor script event"
  type        = number
  default     = 60000
}

variable "browser_monitor_script_events_navigate_wait_wait_for_2" {
  description = "The second wait condition for the second browser monitor script event"
  type        = string
  default     = "validation"
}

variable "browser_monitor_script_events_navigate_wait_validation_type" {
  description = "The validation type for the wait condition in the second browser monitor script event"
  type        = string
  default     = "element_match"
}

variable "browser_monitor_script_events_navigate_wait_validation_match" {
  description = "The validation match for the wait condition in the second browser monitor script event"
  type        = string
  default     = "kjkj"
}

variable "browser_monitor_script_events_navigate_wait_validation_target_locators_locator_type" {
  description = "The locator type for the validation target in the second browser monitor script event"
  type        = string
  default     = "css"
}

variable "browser_monitor_script_events_navigate_wait_validation_target_locators_locator_value" {
  description = "The locator value for the validation target in the second browser monitor script event"
  type        = string
  default     = "jjj"
}

variable "browser_monitor_script_events_description_3" {
  description = "The description of the third browser monitor script event"
  type        = string
  default     = "fvf"
}

variable "browser_monitor_script_events_click_button" {
  description = "The button to click in the third browser monitor script event"
  type        = number
  default     = 0
}

variable "browser_monitor_script_events_click_validate_validation_type" {
  description = "The validation type for the click event in the third browser monitor script event"
  type        = string
  default     = "text_match"
}

variable "browser_monitor_script_events_click_wait_wait_for" {
  description = "The wait condition for the click event in the third browser monitor script event"
  type        = string
  default     = "page_complete"
}

variable "browser_monitor_script_events_description_4" {
  description = "The description of the fourth browser monitor script event"
  type        = string
  default     = "jsfoo"
}

variable "browser_monitor_script_events_javascript_code" {
  description = "The JavaScript code for the fourth browser monitor script event"
  type        = string
  default     = <<-EOT
    let x = 3;
    for (var i = 0; i < x; x++) {
        console.log("asdf");
    }
  EOT
}

variable "browser_monitor_script_events_javascript_wait_wait_for" {
  description = "The wait condition for the JavaScript event in the fourth browser monitor script event"
  type        = string
  default     = "page_complete"
}

variable "browser_monitor_outage_global_consecutive_outage_count_threshold" {
  description = "The global consecutive outage count threshold for the browser monitor outage"
  type        = number
  default     = 3
}

variable "browser_monitor_outage_global_outages" {
  description = "Enable global outages for the browser monitor outage"
  type        = bool
  default     = true
}

variable "browser_monitor_outage_local_consecutive_outage_count_threshold" {
  description = "The local consecutive outage count threshold for the browser monitor outage"
  type        = number
  default     = 5
}

variable "browser_monitor_outage_local_location_outage_count_threshold" {
  description = "The local location outage count threshold for the browser monitor outage"
  type        = number
  default     = 1
}

variable "browser_monitor_outage_local_outages" {
  description = "Enable local outages for the browser monitor outage"
  type        = bool
  default     = true
}

variable "browser_monitor_outage_retry_on_error" {
  description = "Enable retry on error for the browser monitor outage"
  type        = bool
  default     = true
}

variable "browser_monitor_outage_scope" {
  description = "The scope of the browser monitor outage"
  type        = string
  default     = "environment"
}

variable "browser_monitor_performance_enabled" {
  description = "Enable the browser monitor performance"
  type        = bool
  default     = true
}

variable "browser_monitor_performance_scope" {
  description = "The scope of the browser monitor performance"
  type        = string
  default     = "SYNTHETIC_TEST-1234567890000000"
}

variable "browser_monitor_performance_thresholds_event" {
  description = "The event for the browser monitor performance thresholds"
  type        = string
  default     = "SYNTHETIC_TEST-1234567890000000"
}

variable "browser_monitor_performance_thresholds_threshold" {
  description = "The threshold for the browser monitor performance thresholds"
  type        = number
  default     = 10
}
