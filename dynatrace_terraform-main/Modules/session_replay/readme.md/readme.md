

#  Dynatrace Session Replay Modules

This Terraform module provisions **Session Replay configuration resources** in Dynatrace, including **Resource Capture** and **Web Privacy Masking** settings.

It allows users to define how resources (such as images, stylesheets, scripts) and sensitive user data (such as input fields, forms) are captured and masked for **session replay**.

---

##  Modules Included

### 1. `dynatrace_session_replay_resource_capture`

This resource configures whether or not **static and dynamic web resources** should be collected during a user session.

Session Replay uses this information to **accurately reconstruct the session visuals** when replaying it later in Dynatrace.

####  Resource: `dynatrace_session_replay_resource_capture.this`

| Argument                                      | Type           | Description                                                                                                                                                |
| --------------------------------------------- | -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `application_id`                              | `string`       | Logical identifier of the application/environment where session replay is configured.                                                                      |
| `enable_resource_capturing`                   | `bool`         | Enables or disables the capture of static/dynamic resources like JavaScript, CSS, and images for replay visualization.                                     |
| `resource_capture_url_exclusion_pattern_list` | `list(string)` | A list of URLs or patterns (wildcards supported) that should be excluded from being captured. Useful for excluding ads, analytics, or third-party content. |

####  Example

```hcl
resource "dynatrace_session_replay_resource_capture" "this" {
  application_id                              = "environment"
  enable_resource_capturing                   = true
  resource_capture_url_exclusion_pattern_list = ["www.google.com"]
}
```

---

### 2. `dynatrace_session_replay_web_privacy`

This resource defines **privacy and masking** settings during session replay. It allows you to specify **what data to mask or exclude**, such as form fields or sensitive input elements.

#### 🛠 Resource: `dynatrace_session_replay_web_privacy.this`

| Argument                     | Type           | Description                                                                                            |
| ---------------------------- | -------------- | ------------------------------------------------------------------------------------------------------ |
| `application_id`             | `string`       | Logical identifier of the application/environment where session replay is configured.                  |
| `enable_opt_in_mode`         | `bool`         | If `true`, session replay is only enabled when explicitly allowed (e.g., via a rule or user consent).  |
| `url_exclusion_pattern_list` | `list(string)` | List of URLs or patterns where session replay **must not** be recorded (e.g., login or payment pages). |

#####  Nested Block: `masking_presets`

| Field                      | Description                                                                            |
| -------------------------- | -------------------------------------------------------------------------------------- |
| `playback_masking_preset`  | Defines how data is masked during playback. Options: `MASK_ALL`, `ALLOW_LIST`, `NONE`. |
| `recording_masking_preset` | Defines masking strategy during recording. Options: `BLOCK_ALL`, `ALLOW_LIST`, `NONE`. |

#####  Dynamic Block: `recording_masking_allow_list_rules`

Allows you to **fine-tune** what is allowed during recording. If `recording_masking_preset = "ALLOW_LIST"`, you can specify selectors.

| Field            | Type     | Description                                                                                  |
| ---------------- | -------- | -------------------------------------------------------------------------------------------- |
| `css_expression` | `string` | A CSS selector that matches specific elements on your web page.                              |
| `target`         | `string` | The type of content to apply the masking rule to. Valid values: `ELEMENT`, `ATTRIBUTE`, etc. |

####  Example

```hcl
resource "dynatrace_session_replay_web_privacy" "this" {
  application_id             = "environment"
  enable_opt_in_mode         = false
  url_exclusion_pattern_list = ["www.google.com"]

  masking_presets {
    playback_masking_preset  = "MASK_ALL"
    recording_masking_preset = "ALLOW_LIST"

    dynamic "recording_masking_allow_list_rules" {
      for_each = [
        {
          css_expression = "selector.example"
          target         = "ELEMENT"
        }
      ]
      content {
        allow_list_rule {
          css_expression = recording_masking_allow_list_rules.value.css_expression
          target         = recording_masking_allow_list_rules.value.target
        }
      }
    }
  }
}
```

---

##  Variables

### `application_id`

* **Type:** `string`
* **Default:** `"environment"`
* **Description:**
  A logical label representing your web application or environment in Dynatrace. This ensures your configuration is scoped to the right app.

---

### `enable_resource_capturing`

* **Type:** `bool`
* **Default:** `true`
* **Description:**
  When `true`, Dynatrace will capture all static and dynamic web resources to enhance the accuracy of Session Replay.

---

### `resource_capture_url_exclusion_pattern_list`

* **Type:** `list(string)`
* **Default:** `["www.google.com"]`
* **Description:**
  URL patterns (exact match or wildcard) for which resources **should not be captured**. Helps reduce noise or avoid capturing third-party content.

---

### `enable_opt_in_mode`

* **Type:** `bool`
* **Default:** `false`
* **Description:**
  When set to `true`, Session Replay will only activate when triggered by opt-in conditions, such as JavaScript-based consent logic.

---

### `url_exclusion_pattern_list`

* **Type:** `list(string)`
* **Default:** `["www.google.com"]`
* **Description:**
  URL patterns that should be completely excluded from session recording, typically used to avoid sensitive areas such as login, profile, or payment pages.

---

### `playback_masking_preset`

* **Type:** `string`
* **Default:** `"MASK_ALL"`
* **Options:** `MASK_ALL`, `ALLOW_LIST`, `NONE`
* **Description:**
  Specifies how data is displayed during playback.

  * `MASK_ALL`: All user inputs are hidden.
  * `ALLOW_LIST`: Only allow specific inputs (defined in allow list).
  * `NONE`: No masking — not recommended for sensitive data.

---

### `recording_masking_preset`

* **Type:** `string`
* **Default:** `"ALLOW_LIST"`
* **Options:** `BLOCK_ALL`, `ALLOW_LIST`, `NONE`
* **Description:**
  Controls masking during the **actual recording** of the session:

  * `BLOCK_ALL`: Masks everything.
  * `ALLOW_LIST`: Only unmasks elements defined in the allow list.
  * `NONE`: Nothing is masked — use with caution.

---

### `recording_masking_allow_list_rules`

* **Type:** `list(object({ css_expression = string, target = string }))`
* **Default:**

  ```hcl
  [
    {
      css_expression = "selector.example"
      target         = "ELEMENT"
    }
  ]
  ```
* **Description:**
  A list of fine-grained rules that unmask only specific elements during recording. Useful for revealing safe elements like anonymous dropdowns or buttons while masking sensitive inputs.

---

##  Outputs

| Output Name                          | Description                                                                        |
| ------------------------------------ | ---------------------------------------------------------------------------------- |
| `session_replay_resource_capture_id` | ID of the configured resource capture object. Useful for referencing or debugging. |
| `session_replay_web_privacy_id`      | ID of the web privacy configuration object.                                        |

---

## How to Use

1. Update or use the provided `sample.tfvars` file in the root directory to supply values for the modules.
2. All modules are already called in the `main.tf` file in the root.
3. You only need to run the following commands to deploy:

```bash
terraform init
terraform plan -var-file="readme.md/sample.tfvars"
terraform apply -var-file="readme.md/sample.tfvars"
```

---

##  Example `.tfvars` File

```hcl
application_id = "my-app"
enable_resource_capturing = true
resource_capture_url_exclusion_pattern_list = ["https://ads.example.com", "https://analytics.example.com"]
enable_opt_in_mode = false
url_exclusion_pattern_list = ["https://my-app.com/login"]
playback_masking_preset = "MASK_ALL"
recording_masking_preset = "ALLOW_LIST"
recording_masking_allow_list_rules = [
  {
    css_expression = "div.non-sensitive"
    target         = "ELEMENT"
  }
]
```

---

##  Security Consideration

* Do **not** expose sensitive data such as API keys or credentials in variables or outputs.
* Always verify masking and exclusion rules in environments with real data to ensure compliance with data privacy regulations (e.g., GDPR, HIPAA).

---


