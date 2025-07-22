output "ansible_tower_active" {
  description = "Indicates whether the Ansible Tower notification is active"
  value       = var.ansible_tower_active
}

output "ansible_tower_name" {
  description = "Name of the Ansible Tower notification"
  value       = var.ansible_tower_name
}

output "ansible_tower_insecure" {
  description = "Indicates whether the Ansible Tower connection is insecure"
  value       = var.ansible_tower_insecure
}

output "ansible_tower_job_template_url" {
  description = "URL of the Ansible Tower job template"
  value       = var.ansible_tower_job_template_url
}

output "ansible_tower_username" {
  description = "Username for Ansible Tower authentication"
  value       = var.ansible_tower_username
}

output "ansible_tower_custom_message" {
  description = "Custom message for Ansible Tower notification"
  value       = var.ansible_tower_custom_message
}
