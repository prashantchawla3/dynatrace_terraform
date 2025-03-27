variable "enabled" {
  description = "This setting is enabled (true) or disabled (false)"
  type        = bool
}

variable "active_gate_group" {
  description = "ActiveGate group"
  type        = string
  default     = "Terraform"
}

variable "api_url" {
  description = "Cloud Foundry API Target"
  type        = string
}

variable "label" {
  description = "Name this connection"
  type        = string
}

variable "login_url" {
  description = "Cloud Foundry Authentication Endpoint"
  type        = string
}

variable "password" {
  description = "Cloud Foundry Password"
  type        = string
  sensitive   = true
}

variable "username" {
  description = "Cloud Foundry Username"
  type        = string
}

variable "cloud_application_pipeline_enabled" {
  description = "Monitor Kubernetes namespaces, services, workloads, and pods"
  type        = bool
}

variable "event_processing_active" {
  description = "All events are monitored unless event filters are specified"
  type        = bool
}

variable "filter_events" {
  description = "Include only events specified by Events Field Selectors"
  type        = bool
}

variable "include_all_fdi_events" {
  description = "Include all FDI events"
  type        = bool
}

variable "open_metrics_builtin_enabled" {
  description = "Workload and node resource metrics are based on a subset of cAdvisor metrics"
  type        = bool
}

variable "open_metrics_pipeline_enabled" {
  description = "Enable OpenMetrics pipeline"
  type        = bool
}

variable "scope" {
  description = "The scope of this setting (KUBERNETES_CLUSTER)"
  type        = string
}

variable "event_pattern_active" {
  description = "Activate event pattern"
  type        = bool
}

variable "event_pattern_label" {
  description = "Field selector name"
  type        = string
}

variable "event_pattern_pattern" {
  description = "Event pattern"
  type        = string
}

variable "cluster_id" {
  description = "Unique ID of the cluster"
  type        = string
}

variable "cluster_id_enabled" {
  description = "Enable cluster ID"
  type        = bool
}

variable "auth_token" {
  description = "Create a bearer token for Kubernetes or OpenShift"
  type        = string
  sensitive   = true
  default     = ""
}

variable "certificate_check_enabled" {
  description = "Require valid certificates for communication with API server"
  type        = bool
  default     = false
}

variable "endpoint_url" {
  description = "Get the API URL for Kubernetes or OpenShift"
  type        = string
  default     = ""
}

variable "hostname_verification_enabled" {
  description = "Verify hostname in certificate against Kubernetes API URL"
  type        = bool
  default     = false
}

variable "enable_kubernetes_app" {
  description = "Enable new Kubernetes experience"
  type        = bool
}

variable "rule_type_1" {
  description = "Type of the first rule (ANNOTATION or LABEL)"
  type        = string
}

variable "rule_source_1" {
  description = "Source of the first rule"
  type        = string
}

variable "rule_target_1" {
  description = "Target of the first rule"
  type        = string
}

variable "rule_type_2" {
  description = "Type of the second rule (ANNOTATION or LABEL)"
  type        = string
}

variable "rule_source_2" {
  description = "Source of the second rule"
  type        = string
}

variable "rule_target_2" {
  description = "Target of the second rule"
  type        = string
}