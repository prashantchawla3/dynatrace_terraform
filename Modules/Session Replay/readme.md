# Dynatrace Terraform Module

This Terraform module manages Dynatrace resources for session replay, including resource capture and web privacy settings. The module is designed to be flexible and easy to use, providing a comprehensive solution for configuring Dynatrace session replay settings.

## Table of Contents

- Dynatrace Terraform Module
  - Table of Contents
  - Usage
  - Requirements
  - Providers
  - Modules
  - Resources
  - Inputs
  - Outputs

## Usage

To use this module, include it in your Terraform configuration as shown below:

```hcl
module "dynatrace_session_replay" {
  source = "path_to_this_module"

  application_id = var.application_id
  enable_resource_capturing = var.enable_resource_capturing
  resource_capture_url_exclusion_pattern_list = var.resource_capture_url_exclusion_pattern_list
  enable_opt_in_mode = var.enable_opt_in_mode
  url_exclusion_pattern_list = var.url_exclusion_pattern_list
  playback_masking_preset = var.playback_masking_preset
  recording_masking_preset = var.recording_masking_preset
  recording_masking_allow_list_rules_css_expression = var.recording_masking_allow_list_rules_css_expression
  recording_masking_allow_list_rules_target = var.recording_masking_allow_list_rules_target
}
```

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 0.12  |
| dynatrace | ~> 1.0   |

## Providers

| Name      | Version  |
|-----------|----------|
| dynatrace | ~> 1.0   |

## Modules

No modules.

## Resources

| Name                                                                 | Type     |
|----------------------------------------------------------------------|----------|
| dynatrace_session_replay_resource_capture.example | resource |
| dynatrace_session_replay_web_privacy.example           | resource |

### Resource Capture

```hcl
resource "dynatrace_session_replay_resource_capture" "example" {
  application_id = var.application_id
  enable_resource_capturing = var.enable_resource_capturing
  resource_capture_url_exclusion_pattern_list = var.resource_capture_url_exclusion_pattern_list
}
```

### Web Privacy

```hcl
resource "dynatrace_session_replay_web_privacy" "example" {
  application_id = var.application_id
  enable_opt_in_mode = var.enable_opt_in_mode
  url_exclusion_pattern_list = var.url_exclusion_pattern_list
  masking_presets {
    playback_masking_preset = var.playback_masking_preset
    recording_masking_preset = var.recording_masking_preset
    recording_masking_allow_list_rules {
      allow_list_rule {
        css_expression = var.recording_masking_allow_list_rules_css_expression
        target = var.recording_masking_allow_list_rules_target
      }
    }
  }
}
```

## Inputs

| Name                                           | Description                                                                                                  | Type          | Default           | Required |
|------------------------------------------------|--------------------------------------------------------------------------------------------------------------|---------------|-------------------|----------|
| `application_id`                                | The scope of this settings. If the settings should cover the whole environment, just don't specify any scope. | `string`      | `environment`     | no       |
| `enable_resource_capturing`                     | When turned on, Dynatrace captures resources for up to 0.1% of user sessions recorded with Session Replay.    | `bool`        | `true`            | no       |
| `resource_capture_url_exclusion_pattern_list`   | Add exclusion rules to avoid the capture of resources from certain pages.                                     | `list(string)`| `["www.google.com"]`| no       |
| `enable_opt_in_mode`                            | When Session Replay opt-in mode is turned on, Session Replay is deactivated until explicitly activated via an API call. | `bool`        | `false`           | no       |
| `url_exclusion_pattern_list`                    | Exclude webpages or views from Session Replay recording by adding URL exclusion rules.                        | `list(string)`| `["www.google.com"]`| no       |
| `playback_masking_preset`                       | Predefined masking options for playback.                                                                     | `string`      | `MASK_ALL`        | no       |
| `recording_masking_preset`                      | Predefined masking options for recording.                                                                    | `string`      | `ALLOW_LIST`      | no       |
| `recording_masking_allow_list_rules_css_expression` | CSS expression for the allow list rule.                                                                      | `string`      | `selector.example`| no       |
| `recording_masking_allow_list_rules_target`     | Target for the allow list rule.                                                                              | `string`      | `ELEMENT`         | no       |

## Outputs

| Name                                    | Description                                              |
|-----------------------------------------|----------------------------------------------------------|
| `session_replay_resource_capture_id`    | The ID of the session replay resource capture resource   |
| `session_replay_web_privacy_id`         | The ID of the session replay web privacy resource        |

### Example Output

```hcl
output "session_replay_resource_capture_id" {
  description = "The ID of the session replay resource capture resource"
  value       = dynatrace_session_replay_resource_capture.example.id
}

output "session_replay_web_privacy_id" {
  description = "The ID of the session replay web privacy resource"
  value       = dynatrace_session_replay_web_privacy.example.id
}
```

## Terraform Configuration

```hcl
terraform {
  required_providers {
    dynatrace = {
      source  = "dynatrace-oss/dynatrace"
      version = "~> 1.0"
    }
  }
}
```

## Variables

### Application ID

```hcl
variable "application_id" {
  description = "The scope of this settings. If the settings should cover the whole environment, just don't specify any scope."
  type        = string
  default     = "environment"
}
```

### Enable Resource Capturing

```hcl
variable "enable_resource_capturing" {
  description = "When turned on, Dynatrace captures resources for up to 0.1% of user sessions recorded with Session Replay."
  type        = bool
  default     = true
}
```

### Resource Capture URL Exclusion Pattern List

```hcl
variable "resource_capture_url_exclusion_pattern_list" {
  description = "Add exclusion rules to avoid the capture of resources from certain pages."
  type        = list(string)
  default     = ["www.google.com"]
}
```

### Enable Opt-In Mode

```hcl
variable "enable_opt_in_mode" {
  description = "When Session Replay opt-in mode is turned on, Session Replay is deactivated until explicitly activated via an API call."
  type        = bool
  default     = false
}
```

### URL Exclusion Pattern List

```hcl
variable "url_exclusion_pattern_list" {
  description = "Exclude webpages or views from Session Replay recording by adding URL exclusion rules."
  type        = list(string)
  default     = ["www.google.com"]
}
```

### Playback Masking Preset

```hcl
variable "playback_masking_preset" {
  description = "Predefined masking options for playback."
  type        = string
  default     = "MASK_ALL"
}
```

### Recording Masking Preset

```hcl
variable "recording_masking_preset" {
  description = "Predefined masking options for recording."
  type        = string
  default     = "ALLOW_LIST"
}
```

### Recording Masking Allow List Rules CSS Expression

```hcl
variable "recording_masking_allow_list_rules_css_expression" {
  description = "CSS expression for the allow list rule."
  type        = string
  default     = "selector.example"
}
```

### Recording Masking Allow List Rules Target

```hcl
variable "recording_masking_allow_list_rules_target" {
  description = "Target for the allow list rule."
  type        = string
  default     = "ELEMENT"
}
```
## API Token Scopes
This resource requires the API token scopes:
- Read settings (`settings.read`)
- Write settings (`settings.write`)

Make sure your API token includes these scopes to successfully create and manage the Dynatrace session Replay resources.
