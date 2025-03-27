# Dynatrace Terraform Module

This Terraform module manages Dynatrace user settings. It includes configurations for user preferences such as language, region, theme, and timezone, along with necessary variables and outputs.

## Table of Contents

- Dynatrace Terraform Module
  - Table of Contents
  - Usage
  - Requirements
  - Providers
  - Resources
  - Inputs
  - Outputs
  - Example

## Usage

To use this module, include it in your Terraform configuration and provide the necessary variables. Below is an example of how to use this module:

```hcl
module "dynatrace_user_settings" {
  source = "./path_to_module"

  auto_language = var.auto_language
  auto_region = var.auto_region
  auto_theme = var.auto_theme
  auto_timezone = var.auto_timezone
  scope = var.scope
  language = var.language
  region = var.region
  theme = var.theme
  timezone = var.timezone
}
```

## Requirements

- Terraform >= 0.12
- Dynatrace provider >= 1.0

## Providers

| Name      | Version |
|-----------|---------|
| dynatrace | ~> 1.0  |

## Resources

| Name                                                                 | Type     |
|----------------------------------------------------------------------|----------|
| dynatrace_user_settings.example                    | Resource |

### User Settings

```hcl
resource "dynatrace_user_settings" "example" {
  auto_language = var.auto_language
  auto_region = var.auto_region
  auto_theme = var.auto_theme
  auto_timezone = var.auto_timezone
  scope = var.scope
  language = var.language
  region = var.region
  theme = var.theme
  timezone = var.timezone
}
```

## Inputs

| Name                                          | Description                                                                 | Type         | Default             |
|-----------------------------------------------|-----------------------------------------------------------------------------|--------------|---------------------|
| auto_language                                 | Language - use browser default                                              | `bool`       | `true`              |
| auto_region                                   | Region - use browser default                                                | `bool`       | `true`              |
| auto_theme                                    | Theme - use browser default                                                 | `bool`       | `true`              |
| auto_timezone                                 | Timezone - use browser default                                              | `bool`       | `true`              |
| scope                                         | The scope of this setting (user, userdefaults)                              | `string`     | `"user-terraform@dynatrace.com"` |
| language                                      | Language                                                                    | `string`     | `"en"`              |
| region                                        | Region                                                                      | `string`     | `"auto"`            |
| theme                                         | Theme                                                                       | `string`     | `"auto"`            |
| timezone                                      | Timezone                                                                    | `string`     | `"UTC"`             |

## Outputs

| Name                                 | Description                                               |
|--------------------------------------|-----------------------------------------------------------|
| user_settings_id                     | The ID of the user settings resource                      |

## Example

```hcl
module "dynatrace_user_settings" {
  source = "./path_to_module"

  auto_language = true
  auto_region = true
  auto_theme = true
  auto_timezone = true
  scope = "user-terraform@dynatrace.com"
  language = "en"
  region = "auto"
  theme = "auto"
  timezone = "UTC"
}
```

