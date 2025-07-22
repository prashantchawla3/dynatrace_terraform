variable "user_groups" {
  description = "Groups the user belongs to"
  type        = list(string)
  default     = ["monitoring-team", "data-ops"]
}

variable "user_group_name" {
  description = "Name of the user group"
  type        = string
  default     = "sre-team"
}

variable "user_group_ldap_groups" {
  description = "LDAP groups associated with the user group"
  type        = list(string)
  default     = ["cn=sre-group,ou=ldap,dc=company,dc=local"]
}

variable "user_group_sso_groups" {
  description = "SSO groups associated with the user group"
  type        = list(string)
  default     = ["AzureAD_SRE"]
}

variable "user_group_permission" {
  description = "Permission granted to the user group"
  type        = string
  default     = "view_and_configure"
}

variable "user_group_environments" {
  description = "Environments where the permission is granted"
  type        = list(string)
  default     = ["env:prod", "env:staging"]
}
