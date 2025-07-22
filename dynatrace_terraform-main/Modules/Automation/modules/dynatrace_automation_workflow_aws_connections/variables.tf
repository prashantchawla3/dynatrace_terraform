variable "aws_connection" {
  type = object({
    name     = string
    type     = string
    role_arn = string
  })
  description = "AWS connection configuration"
  default = {
    name     = "aws-default"
    type     = "iam"
    role_arn = "arn:aws:iam::123456789012:role/example-role"
  }
}