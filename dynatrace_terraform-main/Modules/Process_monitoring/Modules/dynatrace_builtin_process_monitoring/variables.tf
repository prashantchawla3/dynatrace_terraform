variable "host_group_id" {
  description = "Dynatrace host group ID for process monitoring."
  type        = string
  default     = "environment"
}

variable "aspnetcore" {
  description = "Enable monitoring for ASP.NET Core processes."
  type        = bool
  default     = false
}

variable "cf_appsmanagerjs" {
  description = "Enable monitoring for Cloud Foundry Apps Manager JS."
  type        = bool
  default     = false
}

variable "container" {
  description = "Enable monitoring for container processes."
  type        = bool
  default     = false
}

variable "docker_pauseamd64" {
  description = "Enable monitoring for Docker pause-amd64 process."
  type        = bool
  default     = false
}

variable "exe_bbs" {
  description = "Enable monitoring for BBS executable."
  type        = bool
  default     = false
}

variable "exe_caddy" {
  description = "Enable monitoring for Caddy executable."
  type        = bool
  default     = false
}

variable "exe_schedular" {
  description = "Enable monitoring for Scheduler executable."
  type        = bool
  default     = false
}

variable "exe_silkdaemon" {
  description = "Enable monitoring for Silk Daemon executable."
  type        = bool
  default     = false
}

variable "go_static" {
  description = "Enable monitoring for Go static binaries."
  type        = bool
  default     = false
}

variable "node_nodegyp" {
  description = "Enable monitoring for Node.js node-gyp processes."
  type        = bool
  default     = false
}
