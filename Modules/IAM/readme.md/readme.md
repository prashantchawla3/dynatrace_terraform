# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing IAM groups, permissions, policies, users, and user groups in Dynatrace. The module is designed to simplify the configuration and management of these functionalities using Terraform.

## Table of Contents
- Introduction
- Requirements
- Providers
- Resources
- Inputs
- Outputs
- Usage


## Requirements
- Terraform >= 0.12
- Dynatrace account

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

- `dynatrace_iam_group`
- `dynatrace_iam_permission`
- `dynatrace_iam_policy`
- `dynatrace_iam_policy_bindings`
- `dynatrace_iam_policy_bindings_v2`
- `dynatrace_iam_policy_boundary`
- `dynatrace_iam_user`
- `dynatrace_mgmz_permission`
- `dynatrace_policy`
- `dynatrace_policy_bindings`
- `dynatrace_user`
- `dynatrace_user_group`

## Inputs
### IAM Group Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `iam_group_name` | Name of the IAM group | `string` | `"example-group"` |
| `iam_group_permission_name` | Name of the IAM group permission | `string` | `"example-permission"` |
| `iam_group_permission_type` | Type of the IAM group permission | `string` | `"read"` |
| `iam_group_permission_scope` | Scope of the IAM group permission | `string` | `"global"` |

### IAM Permission Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `iam_permission_name` | Name of the IAM permission | `string` | `"example-permission"` |
| `iam_permission_group` | Group of the IAM permission | `string` | `"example-group"` |
| `iam_permission_account` | Account of the IAM permission | `string` | `"example-account"` |
| `iam_permission_environment` | Environment of the IAM permission | `string` | `"example-environment"` |
| `iam_permission_management_zone` | Management zone of the IAM permission | `string` | `"example-zone"` |

### IAM Policy Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `iam_policy_name` | Name of the IAM policy | `string` | `"example-policy"` |
| `iam_policy_statement_query` | Statement query of the IAM policy | `string` | `"example-query"` |
| `iam_policy_account` | Account of the IAM policy | `string` | `"example-account"` |
| `iam_policy_environment` | Environment of the IAM policy | `string` | `"example-environment"` |
| `iam_policy_description` | Description of the IAM policy | `string` | `"example-description"` |
| `iam_policy_tags` | Tags of the IAM policy | `list(string)` | `["tag1", "tag2"]` |

### IAM Policy Bindings Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `iam_policy_bindings_group` | Group of the IAM policy bindings | `string` | `"example-group"` |
| `iam_policy_bindings_account` | Account of the IAM policy bindings | `string` | `"example-account"` |
| `iam_policy_bindings_environment` | Environment of the IAM policy bindings | `string` | `"example-environment"` |
| `iam_policy_bindings_policies` | Policies of the IAM policy bindings | `list(string)` | `["policy1", "policy2"]` |

### IAM Policy Bindings V2 Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `iam_policy_bindings_v2_group` | Group of the IAM policy bindings v2 | `string` | `"example-group"` |
| `iam_policy_bindings_v2_account` | Account of the IAM policy bindings v2 | `string` | `"example-account"` |
| `iam_policy_bindings_v2_environment` | Environment of the IAM policy bindings v2 | `string` | `"example-environment"` |
| `iam_policy_bindings_v2_policies` | Policies of the IAM policy bindings v2 | `map(object({ id = string, parameters = map(string), metadata = map(string) }))` | `{ policy1 = { id = "policy1-id", parameters = { param1 = "value1", param2 = "value2" }, metadata = { meta1 = "value1", meta2 = "value2" } }, policy2 = { id = "policy2-id", parameters = { param1 = "value1", param2 = "value2" }, metadata = { meta1 = "value1", meta2 = "value2" } } }` |

### IAM Policy Boundary Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `iam_policy_boundary_name` | Name of the IAM policy boundary | `string` | `"example-boundary"` |
| `iam_policy_boundary_query` | Query of the IAM policy boundary | `string` | `"example-query"` |

### IAM User Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `iam_user_email` | Email of the IAM user | `string` | `"user@example.com"` |
| `iam_user_first_name` | First name of the IAM user | `string` | `"John"` |
| `iam_user_last_name` | Last name of the IAM user | `string` | `"Doe"` |
| `iam_user_user_name` | Username of the IAM user | `string` | `"johndoe"` |
| `iam_user_groups` | Groups of the IAM user | `list(string)` | `["group1", "group2"]` |

### Management Zone Permission Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `mgmz_permission_group` | Group of the management zone permission | `string` | `"example-group"` |
| `mgmz_permission_environment` | Environment of the management zone permission | `string` | `"example-environment"` |
| `mgmz_permission_management_zone` | Management zone of the management zone permission | `string` | `"example-zone"` |
| `mgmz_permission_permissions` | Permissions of the management zone permission | `list(string)` | `["permission1", "permission2"]` |

### Policy Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `policy_name` | Name of the policy | `string` | `"example-policy"` |
| `policy_statement_query` | Statement query of the policy | `string` | `"example-query"` |
| `policy_cluster` | Cluster of the policy | `string` | `"example-cluster"` |
| `policy_environment` | Environment of the policy | `string` | `"example-environment"` |
| `policy_description` | Description of the policy | `string` | `"example-description"` |
| `policy_tags` | Tags of the policy | `list(string)` | `["tag1", "tag2"]` |

### Policy Bindings Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `policy_bindings_group` | Group of the policy bindings | `string` | `"example-group"` |
| `policy_bindings_cluster` | Cluster of the policy bindings | `string` | `"example-cluster"` |
| `policy_bindings_environment` | Environment of the policy bindings | `string` | `"example-environment"` |
| `policy_bindings_policies` | Policies of the policy bindings | `list(string)` | `["policy1", "policy2"]` |

### User Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `user_email` | Email of the user | `string` | `"user@example.com"` |
| `user_first_name` | First name of the user | `string` | `"John"` |
| `user_last_name` | Last name of the user | `string` | `"Doe"` |
| `user_user_name` | Username of the user | `string` | `"johndoe"` |
| `user_groups` | Groups of the user | `list(string)` | `["group1", "group2"]` |

### User Group Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| `user_group_name` | Name of the user group | `string` | `"example-group"` |
| `user_group_ldap_groups` | LDAP groups of the user group | `list(string)` | `["ldap-group1", "ldap-group2"]` |
| `user_group_sso_groups` | SSO groups of the user group | `list(string)` | `["sso-group1", "sso-group2"]` |
| `user_group_permission` | Permission of the user group | `string` | `"

To utilize this resource, please define the environment variables DT_CLIENT_ID, DT_CLIENT_SECRET, DT_ACCOUNT_ID with an OAuth client including the following permissions: Allow read access for identity resources (users and groups) (account-idm-read) and Allow write access for identity resources (users and groups) (account-idm-write).

 Allow IAM policy configuration for environments (iam-policies-management) and View environments (account-env-read).
