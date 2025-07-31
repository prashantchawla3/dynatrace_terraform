variable "ansible_connection_count" {
  description = "Number of Ansible connection resources to create"
  type        = number
  default     = 1
}

variable "ansible_connection_names" {
  description = "List of connection names mapped by index"
  type        = list(string)
  default     = ["ansible-connection-1"]
}

variable "ansible_connection_url" {
  description = "The URL endpoint for the Ansible connection"
  type        = string
  default     = "https://ansible.example.com/api/v1/events"
}

variable "ansible_connection_type" {
  description = "Type of Ansible event connection (e.g., 'ANSIBLE', 'WEBHOOK')"
  type        = string
  default     = "ANSIBLE"
}