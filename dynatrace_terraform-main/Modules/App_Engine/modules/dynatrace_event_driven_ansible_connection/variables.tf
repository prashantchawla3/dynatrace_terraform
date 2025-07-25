variable "resource_count" {
  description = "Number of Ansible connection resources to create"
  type        = number
  default     = 1
}

variable "resource_names" {
  description = "List of connection names mapped by index"
  type        = list(string)
  default     = ["ansible-connection-1"]
}

variable "url" {
  description = "The URL endpoint for the Ansible connection"
  type        = string
  default     = "https://ansible.example.com/api/v1/events"
}

variable "type" {
  description = "Type of Ansible event connection (e.g., 'ANSIBLE', 'WEBHOOK')"
  type        = string
  default     = "ANSIBLE"
}

variable "token" {
  description = "Authentication token used for the Ansible connection"
  type        = string
  default     = "REPLACE_WITH_TOKEN"
  sensitive   = true
}
