variable "ansible_tower_active" {
  description = "Enable or disable Ansible Tower integration"
  type        = bool
  default     = false
}

variable "ansible_tower_name" {
  description = "Display name for Ansible Tower destination"
  type        = string
  default     = "AnsibleTower"
}

variable "ansible_tower_insecure" {
  description = "Allow insecure TLS connection for Ansible Tower"
  type        = bool
  default     = false
}

variable "ansible_tower_job_template_url" {
  description = "URL to Ansible Tower job template"
  type        = string
  default     = ""
}

variable "ansible_tower_username" {
  description = "Username for Ansible Tower authentication"
  type        = string
  default     = "admin"
}

variable "ansible_tower_password" {
  description = "Password for Ansible Tower"
  type        = string
  sensitive   = true
  default     = "changeme"
}

variable "ansible_tower_custom_message" {
  description = "Message payload for Ansible Tower execution"
  type        = string
  default     = "Triggered via Dynatrace alert"
}
