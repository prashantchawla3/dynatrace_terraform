resource "dynatrace_ansible_tower_notification" "ansible_tower" {
  active           = var.ansible_tower_active
  name             = var.ansible_tower_name
  profile          = dynatrace_alerting.Default.id
  insecure         = var.ansible_tower_insecure
  job_template_url = var.ansible_tower_job_template_url
  username         = var.ansible_tower_username
  password         = var.ansible_tower_password
  custom_message   = var.ansible_tower_custom_message
}
