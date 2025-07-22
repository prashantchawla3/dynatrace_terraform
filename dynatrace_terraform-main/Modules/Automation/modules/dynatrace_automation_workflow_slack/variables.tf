variable "slack" {
  type = object({
    name  = string
    token = string
  })
  description = "Slack connection configuration"
  default = {
    name  = "slack-default"
    token = "xoxb-your-token"
  }
}