

# Dynatrace User Settings Terraform Module

##  Overview

This Terraform module manages user profile settings in Dynatrace using the `dynatrace_user_settings` resource. It allows configuring individual or multiple user preferences like language, region, theme, and timezone, while also supporting automatic or manual configuration for each preference.

Each configuration is scoped to a specific user or domain and enables organizations to standardize user experiences across Dynatrace environments.

---

##  Module Usage Example

```hcl
module "user_settings" {
  source        = "./modules/dynatrace_user_settings"
  user_settings = {
    "user1" = {
      auto_language  = false
      auto_region    = false
      auto_theme     = false
      auto_timezone  = false
      language       = "en"
      region         = "auto"
      theme          = "dark"
      timezone       = "UTC"
      scope          = "user-terraform@dynatrace.com"
    }
  }
}
```

---

## Resources Created

### `dynatrace_user_settings.this`

This resource configures individual user preferences in Dynatrace. It accepts a map of user settings and iterates over each entry using `for_each`.

Each configuration includes:

| Field           | Description                                                                  |
| --------------- | ---------------------------------------------------------------------------- |
| `auto_language` | Automatically apply preferred language based on browser or location.         |
| `auto_region`   | Automatically select the region based on the user’s location.                |
| `auto_theme`    | Automatically match the Dynatrace UI theme with the system preference.       |
| `auto_timezone` | Automatically set the timezone based on the user's browser location.         |
| `language`      | Manually specify the language (e.g., `"en"` for English, `"fr"` for French). |
| `region`        | Manually set the region (e.g., `"US"`, `"EU"`).                              |
| `theme`         | UI theme preference: `"dark"` or `"light"`.                                  |
| `timezone`      | Preferred timezone (e.g., `"UTC"`, `"America/New_York"`).                    |
| `scope`         | The scope of the user setting, such as a user email or domain.               |

---

## Input Variables

### `user_settings`

**Description:**
A map of user configurations. Each key (e.g., `user1`, `user2`) maps to an object defining how preferences are set for a specific user.

**Type:**

```hcl
map(object({
  auto_language = bool
  auto_region   = bool
  auto_theme    = bool
  auto_timezone = bool
  language      = string
  region        = string
  theme         = string
  timezone      = string
  scope         = string
}))
```

**Default Value:**

```hcl
{
  user01 = {
    auto_language = true
    auto_region   = true
    auto_theme    = false
    auto_timezone = false
    language      = "en"
    region        = "US"
    theme         = "dark"
    timezone      = "America/New_York"
    scope         = "user:john.doe@example.com"
  }

  user02 = {
    auto_language = false
    auto_region   = false
    auto_theme    = true
    auto_timezone = true
    language      = "fr"
    region        = "EU"
    theme         = "light"
    timezone      = "Europe/Paris"
    scope         = "user:jane.smith@example.com"
  }
}
```

**Variable Fields Explained:**

| Variable Name   | Type     | Description                                                                       |
| --------------- | -------- | --------------------------------------------------------------------------------- |
| `auto_language` | `bool`   | Enables automatic language detection. Set to `true` for auto, `false` for manual. |
| `auto_region`   | `bool`   | Enables automatic region detection.                                               |
| `auto_theme`    | `bool`   | Enables auto-detection of theme based on system preference.                       |
| `auto_timezone` | `bool`   | Automatically detect user timezone.                                               |
| `language`      | `string` | Manual language preference, e.g., `"en"`, `"fr"`, `"de"`.                         |
| `region`        | `string` | Region code. Could be `"US"`, `"EU"`, `"auto"` depending on preference.           |
| `theme`         | `string` | `"dark"` or `"light"` UI theme.                                                   |
| `timezone`      | `string` | Timezone in IANA format, e.g., `"UTC"`, `"Europe/Berlin"`.                        |
| `scope`         | `string` | Required. User identifier, typically in format `user:email@example.com`.          |

---

## Outputs

### `user_settings_ids`

**Description:**
Returns a map of all created `dynatrace_user_settings` resource IDs keyed by their input names.

**Example Output:**

```hcl
{
  user1 = "abc123-xyz"
  user2 = "def456-uvw"
}
```

This is useful for referencing or debugging specific user settings created through this module.

---

## Security Note

> This module does **not store any secrets**, tokens, or passwords.
> All values passed via variables are meant to be **non-sensitive** user preference data.

---

##  Example - Multi-User Configuration

```hcl
user_settings = {
  "admin" = {
    auto_language  = true
    auto_region    = false
    auto_theme     = false
    auto_timezone  = true
    language       = "de"
    region         = "EU"
    theme          = "dark"
    timezone       = "Europe/Berlin"
    scope          = "user:admin@example.com"
  }

  "qa_user" = {
    auto_language  = false
    auto_region    = false
    auto_theme     = false
    auto_timezone  = false
    language       = "en"
    region         = "US"
    theme          = "light"
    timezone       = "America/Chicago"
    scope          = "user:qa@example.com"
  }
}
```

---

##  Best Practices

* Use consistent timezone and region formats to avoid confusion.
* Prefer `"auto"` only where suitable and tested in your environment.
* Use valid user emails in `scope` (e.g., `user:someone@example.com`).
* Keep `user_settings` map keys meaningful (`"admin"`, `"dev_team"`, etc.).

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