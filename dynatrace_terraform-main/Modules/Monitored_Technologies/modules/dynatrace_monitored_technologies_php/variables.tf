variable "technologies" {
  description = "Map of monitored technologies and their configurations. Includes settings for PHP."
  type = map(object({
    enabled  = bool
    host_id  = string
  }))
  default = {
    php = {
      enabled = true
      host_id = "host-php-001"
    }
  }
}
