variable "technology_enabled" {
  description = "Enable or disable creation of dynatrace_container_technology"
  type        = bool
  default     = true
}

variable "bosh_process_manager" {
  description = "Enable monitoring for BOSH"
  type        = bool
  default     = false
}

variable "containerd" {
  description = "Enable monitoring for containerd"
  type        = bool
  default     = true
}

variable "crio" {
  description = "Enable monitoring for CRI-O"
  type        = bool
  default     = true
}

variable "docker" {
  description = "Enable monitoring for Docker"
  type        = bool
  default     = true
}

variable "docker_windows" {
  description = "Enable monitoring for Docker on Windows"
  type        = bool
  default     = false
}

variable "garden" {
  description = "Enable monitoring for Garden"
  type        = bool
  default     = false
}

variable "podman" {
  description = "Enable monitoring for Podman"
  type        = bool
  default     = false
}

variable "scope" {
  description = "Scope for the container technology (e.g., environment scope)"
  type        = string
  default     = ""
}

variable "winc" {
  description = "Enable monitoring for Windows containers (winc)"
  type        = bool
  default     = false
}
