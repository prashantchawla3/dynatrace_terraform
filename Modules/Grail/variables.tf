variable "segment_name" {
  description = "The name of the Dynatrace segment."
  type        = string
}

variable "segment_description" {
  description = "The description of the Dynatrace segment."
  type        = string
}

variable "is_public" {
  description = "Indicates if the filter-segment is publicly accessible within the tenant."
  type        = bool
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
}