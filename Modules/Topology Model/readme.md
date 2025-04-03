# Dynatrace Terraform Module

## Introduction
This Terraform module manages Dynatrace resources for generic relationships, generic types, and Grail security contexts. It includes configurations for these resources along with necessary variables and outputs.

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
module "dynatrace_generic" {
  source = "./path_to_module"
  generic_relationships_enabled = var.generic_relationships_enabled
  generic_relationships_created_by = var.generic_relationships_created_by
  generic_relationships_from_role = var.generic_relationships_from_role
  generic_relationships_from_type = var.generic_relationships_from_type
  generic_relationships_to_role = var.generic_relationships_to_role
  generic_relationships_to_type = var.generic_relationships_to_type
  generic_relationships_type_of_relation = var.generic_relationships_type_of_relation
  generic_relationships_sources_condition = var.generic_relationships_sources_condition
  generic_relationships_sources_source_type = var.generic_relationships_sources_source_type
  generic_types_name = var.generic_types_name
  generic_types_enabled = var.generic_types_enabled
  generic_types_created_by = var.generic_types_created_by
  generic_types_display_name = var.generic_types_display_name
  generic_types_rules_icon_pattern = var.generic_types_rules_icon_pattern
  generic_types_rules_id_pattern = var.generic_types_rules_id_pattern
  generic_types_rules_instance_name_pattern = var.generic_types_rules_instance_name_pattern
  generic_types_rules_attributes_key = var.generic_types_rules_attributes_key
  generic_types_rules_attributes_pattern = var.generic_types_rules_attributes_pattern
  generic_types_rules_required_dimensions_key = var.generic_types_rules_required_dimensions_key
  generic_types_rules_sources_condition = var.generic_types_rules_sources_condition
  generic_types_rules_sources_source_type = var.generic_types_rules_sources_source_type
  grail_security_context_entity_type = var.grail_security_context_entity_type
  grail_security_context_destination_property = var.grail_security_context_destination_property
}
```

## Requirements
- Terraform >= 0.12
- Dynatrace provider >= 1.0

## Providers
The module requires the following provider:

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

## Resources
The following resources are created by this module:

- `dynatrace_generic_relationships`
- `dynatrace_generic_types`
- `dynatrace_grail_security_context`

## Inputs
### Dashboard Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `generic_relationships_enabled` | Enable or disable the generic relationships resource | `bool` | `true` |
| `generic_relationships_created_by` | The user or extension that created this relationship | `string` | `"Terraform"` |
| `generic_relationships_from_role` | Specify a role for the source entity | `string` | `"terraformrole"` |
| `generic_relationships_from_type` | Define an entity type as the source of the relationship | `string` | `"os:service"` |
| `generic_relationships_to_role` | Specify a role for the destination entity | `string` | `"terraformrole"` |
| `generic_relationships_to_type` | Define an entity type as the destination of the relationship | `string` | `"terraformdestination"` |
| `generic_relationships_type_of_relation` | Type of the relationship | `string` | `"PART_OF"` |
| `generic_relationships_sources_condition` | Condition for the source | `string` | `"$eq(terraform)"` |
| `generic_relationships_sources_source_type` | Source type for the relationship | `string` | `"Metrics"` |
| `generic_types_name` | The entity type name | `string` | `"terraform:type"` |
| `generic_types_enabled` | Enable or disable the generic types resource | `bool` | `true` |
| `generic_types_created_by` | The user or extension that created this type | `string` | `"Terraform"` |
| `generic_types_display_name` | The human readable type name for this entity type | `string` | `"TerraformTest"` |
| `generic_types_rules_icon_pattern` | Pattern for the icon attribute | `string` | `"{TerraformIcon}"` |
| `generic_types_rules_id_pattern` | Pattern for the ID attribute | `string` | `"{TerraformPlaceholder}"` |
| `generic_types_rules_instance_name_pattern` | Pattern for the instance name attribute | `string` | `"{TerraformInstance}"` |
| `generic_types_rules_attributes_key` | Key for the attribute | `string` | `"TerraformAttribute"` |
| `generic_types_rules_attributes_pattern` | Pattern for the attribute | `string` | `"{TerraformExtraction}"` |
| `generic_types_rules_required_dimensions_key` | Key for the required dimension | `string` | `"TerraformDimension"` |
| `generic_types_rules_sources_condition` | Condition for the source | `string` | `"$eq(TerraformCondition)"` |
| `generic_types_rules_sources_source_type` | Source type for the rule | `string` | `"Events"` |
| `grail_security_context_entity_type` | Type of the entity whose security context to override | `string` | `"exampletype"` |
| `grail_security_context_destination_property` | The case-sensitive name of a property of the destination type | `string` | `"exampleproperty"` |

## Outputs
| Name | Description |
|------|-------------|
| `generic_relationships_id` | The ID of the generic relationships resource |
| `generic_types_id` | The ID of the generic types resource |
| `grail_security_context_id` | The ID of the Grail security context resource |

## Example
```hcl
module "dynatrace_generic" {
  source = "./path_to_module"
  generic_relationships_enabled = true
  generic_relationships_created_by = "Terraform"
  generic_relationships_from_role = "terraformrole"
  generic_relationships_from_type = "os:service"
  generic_relationships_to_role = "terraformrole"
  generic_relationships_to_type = "terraformdestination"
  generic_relationships_type_of_relation = "PART_OF"
  generic_relationships_sources_condition = "$eq(terraform)"
  generic_relationships_sources_source_type = "Metrics"
  generic_types_name = "terraform:type"
  generic_types_enabled = true
  generic_types_created_by = "Terraform"
  generic_types_display_name = "TerraformTest"
  generic_types_rules_icon_pattern = "{TerraformIcon}"
  generic_types_rules_id_pattern = "{TerraformPlaceholder}"
  generic_types_rules_instance_name_pattern = "{TerraformInstance}"
  generic_types_rules_attributes_key = "TerraformAttribute"
  generic_types_rules_attributes_pattern = "{TerraformExtraction}"
  generic_types_rules_required_dimensions_key = "TerraformDimension"
  generic_types_rules_sources_condition = "$eq(TerraformCondition)"
  generic_types_rules_sources_source_type = "Events"
  grail_security_context_entity_type = "exampletype"
  grail_security_context_destination_property = "exampleproperty"
}
```

## API Token Scopes
This resource requires the API token scopes:
- Read settings (`settings.read`)
- Write settings (`settings.write`)

Make sure your API token includes these scopes to successfully create and manage the Dynatrace resources.

