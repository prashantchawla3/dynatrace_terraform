

#  Dynatrace AutoTag and Custom Tags Terraform Modules

This Terraform module collection is designed to help you manage **Dynatrace AutoTag rules**, **custom entity tags**, and **AutoTag rule selectors** using reusable, structured Terraform code.

---

##  Modules Overview

### `dynatrace_autotag_v2`

Defines **AutoTags** using metadata-based rules and optional propagation settings.

### `dynatrace_custom_tags`

Assigns **static custom tags** to Dynatrace entities based on entity selectors.

### `dynatrace_autotag_rules`

Defines **AutoTag rules** using `entitySelector` syntax rather than metadata-based attributes.

---

##  Module: `dynatrace_autotag_v2`

### Resource: `dynatrace_autotag_v2`

Creates an **AutoTag rule** based on metadata such as environment or team. You can configure whether the tag propagates across service relationships.

#### Features:

* Supports dynamic condition blocks
* Supports propagation to host and process groups

---

###  Inputs

| Name            | Type           | Description                                                                                                       | Example                   |
| --------------- | -------------- | ----------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `autotag_name`  | `string`       | The name of the AutoTag rule that appears in the Dynatrace UI.                                                    | `"AutoTag:TeamOwnership"` |
| `autotag_rules` | `list(object)` | A list of rules defining how to extract tags from metadata. Each rule supports propagation and condition filters. | *See full example below*  |

Each object in `autotag_rules` has the following structure:

```hcl
{
  type                        = "PROPERTY" # or "ME"
  enabled                     = true
  value_format                = "{Environment}:{Team}"
  value_normalization         = "UPPERCASE"
  entity_type                 = "SERVICE"
  service_to_host_propagation = true
  service_to_pgpropagation    = false
  conditions = [
    {
      dynamic_key        = "Environment"
      dynamic_key_source = "METADATA"
      key                = "env"
      operator           = "EQUALS"
      tag                = "Environment:Production"
    }
  ]
}
```

####  Key Condition Fields

* `dynamic_key`: Variable key name
* `dynamic_key_source`: Source (e.g., `ENVIRONMENT`, `METADATA`)
* `key`: Dynatrace internal key (like `env`)
* `operator`: Logic operator (`EQUALS`, `EXISTS`, etc.)
* `tag`: Optional static tag match (if using `TAG_*` operators)

---

###  Output

| Name         | Description                                     |
| ------------ | ----------------------------------------------- |
| `autotag_id` | The ID of the created AutoTag rule in Dynatrace |

---

##  Module: `dynatrace_autotag_rules`

###  Resource: `dynatrace_autotag_rules`

This module links the AutoTag rule (from `dynatrace_autotag_v2`) with **entity selector-based logic**.

#### Purpose:

Use Dynatrace's powerful [Entity Selector](https://www.dynatrace.com/support/help/shortlink/entityselector) to tag specific entities without relying on metadata.

---

###  Inputs

| Name                     | Type           | Description                                                                           | Example |
| ------------------------ | -------------- | ------------------------------------------------------------------------------------- | ------- |
| `autotag_selector_rules` | `list(object)` | A list of selector-based rules for tagging entities using the `ENTITY_SELECTOR` type. |         |

Each object structure:

```hcl
{
  type                = "ENTITY_SELECTOR"
  enabled             = true
  entity_selector     = "type(SERVICE),tag([Environment:Production])"
  value_format        = "Production"
  value_normalization = "NONE"
}
```

* `entity_selector`: Dynatrace DSL for matching entities
* `value_format`: Value to apply if the rule matches
* `value_normalization`: Optional formatting (e.g., `UPPERCASE`, `NONE`)

---

### Output

| Name               | Description                                          |
| ------------------ | ---------------------------------------------------- |
| `autotag_rules_id` | The ID of the Dynatrace AutoTag rule selector object |

---

##  Module: `dynatrace_custom_tags`

###  Resource: `dynatrace_custom_tags`

This module assigns **custom static tags** (not dynamic AutoTags) to entities that match a given selector. These are useful for permanent static annotations.

---

###  Inputs

| Name              | Type           | Description                                              | Example                       |
| ----------------- | -------------- | -------------------------------------------------------- | ----------------------------- |
| `entity_selector` | `string`       | Dynatrace Entity Selector query to match target entities | `"type(HOST),tag([Zone:EU])"` |
| `custom_tags`     | `list(object)` | List of key/value/context tags to assign                 |                               |

Each tag object:

```hcl
{
  context = "CONTEXTLESS"
  key     = "Owner"
  value   = "Platform Team"
}
```

* `context`: Tag context (e.g., `CONTEXTLESS`, `AWS`, `KUBERNETES`)
* `key`: Tag key name
* `value`: Optional tag value

---

### Output

| Name             | Description                                         |
| ---------------- | --------------------------------------------------- |
| `custom_tags_id` | ID of the custom tags resource created in Dynatrace |

---

## Example Usage

```hcl
module "autotag_v2" {
  source         = "./modules/dynatrace_autotag_v2"
  autotag_name   = var.autotag_name
  autotag_rules  = var.autotag_rules
}

module "autotag_rules" {
  source                 = "./modules/dynatrace_autotag_rules"
  autotag_selector_rules = var.autotag_selector_rules
  auto_tag_id            = module.autotag_v2.autotag_id
}

module "custom_tags" {
  source          = "./modules/dynatrace_custom_tags"
  entity_selector = var.entity_selector
  custom_tags     = var.custom_tags
}
```

---




##  Notes

* These modules do not manage access, roles, or credentials.
* If you update an `autotag_rule` or `entity_selector`, re-running `terraform apply` will update Dynatrace accordingly.
* Changes in rules may take a few minutes to reflect in the Dynatrace UI.

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
