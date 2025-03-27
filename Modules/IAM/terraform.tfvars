iam_group_name = "example-group"
iam_group_permission_name = "example-permission"
iam_group_permission_type = "read"
iam_group_permission_scope = "global"

iam_permission_name = "example-permission"
iam_permission_group = "example-group"
iam_permission_account = "example-account"
iam_permission_environment = "example-environment"
iam_permission_management_zone = "example-zone"

iam_policy_name = "example-policy"
iam_policy_statement_query = "example-query"
iam_policy_account = "example-account"
iam_policy_environment = "example-environment"
iam_policy_description = "example-description"
iam_policy_tags = ["tag1", "tag2"]

iam_policy_bindings_group = "example-group"
iam_policy_bindings_account = "example-account"
iam_policy_bindings_environment = "example-environment"
iam_policy_bindings_policies = ["policy1", "policy2"]

iam_policy_bindings_v2_group = "example-group"
iam_policy_bindings_v2_account = "example-account"
iam_policy_bindings_v2_environment = "example-environment"
iam_policy_bindings_v2_policies = {
  policy1 = {
    id = "policy1-id"
    parameters = {
      param1 = "value1"
      param2 = "value2"
    }
    metadata = {
      meta1 = "value1"
      meta2 = "value2"
    }
  }
  policy2 = {
    id = "policy2-id"
    parameters = {
      param1 = "value1"
      param2 = "value2"
    }
    metadata = {
      meta1 = "value1"
      meta2 = "value2"
    }
  }
}

iam_policy_boundary_name = "example-boundary"
iam_policy_boundary_query = "example-query"

iam_user_email = "user@example.com"
iam_user_first_name = "John"
iam_user_last_name = "Doe"
iam_user_user_name = "johndoe"
iam_user_groups = ["group1", "group2"]

mgmz_permission_group = "example-group"
mgmz_permission_environment = "example-environment"
mgmz_permission_management_zone = "example-zone"
mgmz_permission_permissions = ["permission1", "permission2"]

policy_name = "example-policy"
policy_statement_query = "example-query"
policy_cluster = "example-cluster"
policy_environment = "example-environment"
policy_description = "example-description"
policy_tags = ["tag1", "tag2"]

policy_bindings_group = "example-group"
policy_bindings_cluster = "example-cluster"
policy_bindings_environment = "example-environment"
policy_bindings_policies = ["policy1", "policy2"]

user_email = "user@example.com"
user_first_name = "John"
user_last_name = "Doe"
user_user_name = "johndoe"
user_groups = ["group1", "group2"]

user_group_name = "example-group"
user_group_ldap_groups = ["ldap-group1", "ldap-group2"]
user_group_sso_groups = ["sso-group1", "sso-group2"]
user_group_permission = "example-permission"
user_group_environments = ["env1", "env2"]
