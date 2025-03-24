# Dynatrace Terraform Module

This Terraform module manages Dynatrace resources for auto-tagging, auto-tag rules, and custom tags. It includes configurations for these resources along with necessary variables and outputs.

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
module "dynatrace_autotag" {
  source = "./path_to_module"

  autotag_name = var.autotag_name
  entity_selector = var.entity_selector
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
| dynatrace_autotag_v2.example                            | Resource |
| dynatrace_autotag_rules.example                   | Resource |
| dynatrace_custom_tags.example                        | Resource |

### Auto Tag

```hcl
resource "dynatrace_autotag_v2" "example" {
  name = var.autotag_name
  rules_maintained_externally = true
  rules {
    rule {
      type = "ME"
      enabled = true
      value_format = "{ProcessGroup:Environment:keptn_stage}"
      value_normalization = "Leave text as-is"
      attribute_rule {
        entity_type = "SERVICE"
        service_to_host_propagation = false
        service_to_pgpropagation = true
        conditions {
          condition {
            dynamic_key = "keptn_stage"
            dynamic_key_source = "ENVIRONMENT"
            key = "PROCESS_GROUP_CUSTOM_METADATA"
            operator = "EXISTS"
          }
        }
      }
    }
    rule {
      type = "ME"
      enabled = true
      value_format = "prod"
      value_normalization = "Leave text as-is"
      attribute_rule {
        entity_type = "SYNTHETIC_TEST"
        conditions {
          condition {
            key = "BROWSER_MONITOR_TAGS"
            operator = "TAG_KEY_EQUALS"
            tag = "prod"
          }
        }
      }
    }
  }
}
```

### Auto Tag Rules

```hcl
resource "dynatrace_autotag_rules" "example" {
  auto_tag_id = dynatrace_autotag_v2.example.id
  rules {
    rule {
      type = "SELECTOR"
      enabled = true
      entity_selector = "type(SERVICE),tag(sample)"
      value_format = "disabled"
      value_normalization = "Leave text as-is"
    }
  }
}
```

### Custom Tags

```hcl
resource "dynatrace_custom_tags" "example" {
  entity_selector = var.entity_selector
  tags {
    filter {
      context = "CONTEXTLESS"
      key = "KeyExampleA"
    }
    filter {
      context = "CONTEXTLESS"
      key = "KeyExampleA"
      value = "ValueExample1"
    }
    filter {
      context = "CONTEXTLESS"
      key = "KeyExampleB"
    }
    filter {
      context = "CONTEXTLESS"
      key = "KeyExampleC"
      value = "ValueExample2"
    }
  }
}
```

## Inputs

| Name                                          | Description                                                                 | Type         | Default             |
|-----------------------------------------------|-----------------------------------------------------------------------------|--------------|---------------------|
| autotag_name                                  | The name of the auto tag                                                    | `string`     | `"example_tag"`     |
| entity_selector                               | Specifies the entities where you want to update tags                        | `string`     | `"entityId(\"HOST-123456789000000\")"` |

## Outputs

| Name                                 | Description                                               |
|--------------------------------------|-----------------------------------------------------------|
| autotag_id                           | The ID of the auto tag resource                           |
| autotag_rules_id                     | The ID of the auto tag rules resource                     |
| custom_tags_id                       | The ID of the custom tags resource                        |

## Example

```hcl
module "dynatrace_autotag" {
  source = "./path_to_module"

  autotag_name = "example_tag"
  entity_selector = "entityId(\"HOST-123456789000000\")"
}
```
