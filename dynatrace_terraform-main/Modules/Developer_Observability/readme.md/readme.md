# Dynatrace Terraform Modules Documentation

This folder provides modular Terraform configurations for managing Dynatrace DevOps features. Each module is reusable and includes complete documentation for ease of use and clarity. This README provides an in-depth explanation of all resources, variables, and how to use them effectively.

> **Note:** No secrets or credentials are stored or referenced. Always configure authentication securely outside these modules.

---

## Modules Overview

### 1. `dynatrace_devobs_agent_optin`

This module enables or disables the DevOps Agent for a specific scope (e.g., a process group or environment).

#### Resources Used

* `dynatrace_devobs_agent_optin`: Manages the DevOps Agent opt-in configuration for a specified scope.

#### Variables

* `agent_optin_scope` *(string)*: Defines the scope to which the DevOps agent setting should apply (e.g., environment, process group ID).

  * **Example**: `"PROCESS_GROUP-1234567890000000"`

* `agent_optin_enabled` *(bool)*: Enables (`true`) or disables (`false`) the DevOps agent for the defined scope.

  * **Example**: `false`

#### Outputs

* `agent_optin_scope`: Returns the scope to which the opt-in setting was applied.

---

### 2. `dynatrace_devobs_data_masking`

This module sets up data masking rules for sensitive data like tokens, secrets, or headers.

#### Resources Used

* `dynatrace_devobs_data_masking`: Configures a data masking rule based on pattern and replacement type.

#### Variables

* `data_masking_enabled` *(bool)*: Enables or disables the data masking rule.

  * **Example**: `false`

* `data_masking_replacement_pattern` *(string)*: Regex pattern to match sensitive data for masking.

  * **Example**: `"example_pattern"`

* `data_masking_replacement_type` *(string)*: The action to take when a match is found. Accepts `MASK` or `REMOVE`.

  * **Example**: `"STRING"`

* `data_masking_rule_name` *(string)*: Name for the masking rule.

  * **Example**: `"example_rule"`

* `data_masking_rule_type` *(string)*: Type of field the rule targets, such as `header` or `parameter`.

  * **Example**: `"VAR_NAME"`

* `data_masking_rule_var_name` *(string)*: Name of the variable or field to mask.

  * **Example**: `"example_var"`

#### Outputs

* `data_masking_rule_name`: Returns the name of the created data masking rule.

---

### 3. `dynatrace_devobs_git_onprem`

This module integrates Dynatrace with an on-premises Git provider.

#### Resources Used

* `dynatrace_devobs_git_onprem`: Configures the Git integration for on-prem SCM tools like GitLab or Bitbucket.

#### Variables

* `git_onprem_provider` *(string)*: Name of the Git provider. Valid options include `GitLab`, `Bitbucket`, `GithubOnPrem`, etc.

  * **Example**: `"GithubOnPrem"`

* `git_onprem_url` *(string)*: Full URL to the Git provider's API or service endpoint.

  * **Example**: `"http://www.google.com/test/example"`

#### Outputs

* `git_onprem_url`: Returns the configured Git provider URL.

---

## Example Usage

```hcl
module "agent_optin" {
  source              = "./modules/dynatrace_devobs_agent_optin"
  agent_optin_scope   = var.agent_optin_scope
  agent_optin_enabled = var.agent_optin_enabled
}

module "data_masking" {
  source                             = "./modules/dynatrace_devobs_data_masking"
  data_masking_enabled              = var.data_masking_enabled
  data_masking_replacement_pattern  = var.data_masking_replacement_pattern
  data_masking_replacement_type     = var.data_masking_replacement_type
  data_masking_rule_name            = var.data_masking_rule_name
  data_masking_rule_type            = var.data_masking_rule_type
  data_masking_rule_var_name        = var.data_masking_rule_var_name
}

module "git_onprem" {
  source            = "./modules/dynatrace_devobs_git_onprem"
  git_onprem_provider = var.git_onprem_provider
  git_onprem_url      = var.git_onprem_url
}
```
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
---

## Notes

* Be cautious with pattern matching in data masking to avoid masking unintended data.
* Confirm that the `agent_optin_scope` and `git_onprem_url` match actual Dynatrace and Git configuration.
* Avoid hardcoding secrets or credentials in Terraform files; use secure backend or environment injection methods.

---
