variable "key_request_ids" {
  description = "Map of key request identifiers with their display names."
  type        = map(string)
  default     = {}
}

variable "key_request_names" {
  description = "List of request names considered critical (key requests)."
  type        = list(string)
  default     = []
}
