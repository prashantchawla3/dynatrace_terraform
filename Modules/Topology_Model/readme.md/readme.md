# Dynatrace Terraform Modules Documentation

This documentation provides a detailed and user-friendly explanation of each module, resource, and input variable used in the Dynatrace Terraform setup. It ensures clarity, accuracy, and usability so that any user can easily understand what each resource does, how variables are used, and how to configure them.

---

## Module: `dynatrace_generic_relationships`

### Purpose

Defines **custom relationships** between Dynatrace entities (e.g., hosts, services). These relationships help visualize entity dependencies and roles within Dynatrace.

### Resources

* **`dynatrace_generic_relationships`**: Configures a directional relationship between two Dynatrace entities with roles, types, and optional source filtering.

### Variables

| Variable                                    | Description                                                          | Type     | Example                  | Default               |
| ------------------------------------------- | -------------------------------------------------------------------- | -------- | ------------------------ | --------------------- |
| `generic_relationships_enabled`             | Enables or disables creation of the relationship.                    | `bool`   | `true`                   | `true`                |
| `generic_relationships_created_by`          | Identifier for team or automation that created the rule.             | `string` | `"Terraform"`            | `"automation-team"`   |
| `generic_relationships_from_role`           | Logical role of the source entity (e.g., owner, initiator).          | `string` | `"terraformrole"`        | `"owner"`             |
| `generic_relationships_from_type`           | Dynatrace entity type for the source node (e.g., host, os\:service). | `string` | `"os:service"`           | `"host"`              |
| `generic_relationships_to_role`             | Logical role of the destination entity (e.g., dependency, backend).  | `string` | `"terraformrole"`        | `"backend"`           |
| `generic_relationships_to_type`             | Entity type of the destination node (e.g., service, database).       | `string` | `"terraformdestination"` | `"service"`           |
| `generic_relationships_type_of_relation`    | Relationship type label (e.g., PART\_OF, COMMUNICATES\_WITH).        | `string` | `"PART_OF"`              | `"communicates_with"` |
| `generic_relationships_sources_condition`   | Condition expression for filtering sources (e.g., `$eq(terraform)`). | `string` | `"$eq(terraform)"`       | `"key == 'region'"`   |
| `generic_relationships_sources_source_type` | Where the condition applies: `METADATA`, `ENTITY`, `Metrics`.        | `string` | `"Metrics"`              | `"METADATA"`          |

### Output

| Output                     | Description                                         |
| -------------------------- | --------------------------------------------------- |
| `generic_relationships_id` | ID of the created generic relationship in Dynatrace |

---

## Module: `dynatrace_generic_types`

### Purpose

Defines a **custom entity type** within Dynatrace, allowing tailored representations of logical or technical components, including matching rules, attributes, and display properties.

### Resources

* **`dynatrace_generic_types`**: Registers a new custom entity type and matching rules.

### Variables

| Variable                                      | Description                                               | Type     | Example                     | Default                         |
| --------------------------------------------- | --------------------------------------------------------- | -------- | --------------------------- | ------------------------------- |
| `generic_types_name`                          | Unique identifier for the custom type.                    | `string` | `"terraform:type"`          | `"custom_host_type"`            |
| `generic_types_enabled`                       | Enable or disable the custom type.                        | `bool`   | `true`                      | `true`                          |
| `generic_types_created_by`                    | Creator or automation name.                               | `string` | `"Terraform"`               | `"terraform-module"`            |
| `generic_types_display_name`                  | Display name in the Dynatrace UI.                         | `string` | `"TerraformTest"`           | `"Custom Host Type"`            |
| `generic_types_rules_icon_pattern`            | Icon identifier or pattern.                               | `string` | `"{TerraformIcon}"`         | `"os:linux"`                    |
| `generic_types_rules_id_pattern`              | Pattern that defines the entity ID (e.g., `{host.name}`). | `string` | `"{TerraformPlaceholder}"`  | `"{host.name}"`                 |
| `generic_types_rules_instance_name_pattern`   | Custom instance label.                                    | `string` | `"{TerraformInstance}"`     | `"{host.name} - {environment}"` |
| `generic_types_rules_attributes_key`          | Metadata key for an attribute.                            | `string` | `"TerraformAttribute"`      | `"environment"`                 |
| `generic_types_rules_attributes_pattern`      | Pattern for matching attribute value.                     | `string` | `"{TerraformExtraction}"`   | `".*prod.*"`                    |
| `generic_types_rules_required_dimensions_key` | Required metadata key to recognize entity.                | `string` | `"TerraformDimension"`      | `"region"`                      |
| `generic_types_rules_sources_condition`       | Rule condition for selection.                             | `string` | `"$eq(TerraformCondition)"` | `"environment == 'prod'"`       |
| `generic_types_rules_sources_source_type`     | Source data type (e.g., `METADATA`, `LOGS`, `EVENTS`).    | `string` | `"Events"`                  | `"METADATA"`                    |

### Output

| Output             | Description                                       |
| ------------------ | ------------------------------------------------- |
| `generic_types_id` | ID of the defined custom entity type in Dynatrace |

---

## Module: `dynatrace_grail_security_context`

### Purpose

Defines a **security context** mapping in Dynatrace Grail to enforce access scoping using entity types and metadata fields.

### Resources

* **`dynatrace_grail_security_context`**: Maps a user or system field to an entity type in Grail for security enforcement.

### Variables

| Variable                                      | Description                                         | Type     | Example             | Default   |
| --------------------------------------------- | --------------------------------------------------- | -------- | ------------------- | --------- |
| `grail_security_context_entity_type`          | Entity type for which the security context applies. | `string` | `"exampletype"`     | `"user"`  |
| `grail_security_context_destination_property` | Metadata field for scoping (e.g., email, tenantId). | `string` | `"exampleproperty"` | `"email"` |

### Output

| Output                      | Description                                            |
| --------------------------- | ------------------------------------------------------ |
| `grail_security_context_id` | ID of the created Grail security context configuration |

---

## Usage Example (Root Module)

```hcl
module "grail_relationship" {
  source = "./modules/dynatrace_generic_relationships"
  generic_relationships_enabled = true
  generic_relationships_created_by = "Terraform"
  generic_relationships_from_role = "terraformrole"
  generic_relationships_from_type = "os:service"
  generic_relationships_to_role = "terraformrole"
  generic_relationships_to_type = "terraformdestination"
  generic_relationships_type_of_relation = "PART_OF"
  generic_relationships_sources_condition = "$eq(terraform)"
  generic_relationships_sources_source_type = "Metrics"
}

module "grail_entity_type" {
  source = "./modules/dynatrace_generic_types"
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
}

module "grail_security_context" {
  source = "./modules/dynatrace_grail_security_context"
  grail_security_context_entity_type = "exampletype"
  grail_security_context_destination_property = "exampleproperty"
}
```

---

## Notes

* No secrets or credentials are used or stored in this configuration.
* All modules are designed to be reusable, configurable via variables, and easily testable.
* Use `terraform plan` to validate inputs before applying.

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