variable "aws_services" {
  description = "AWS services to monitor with recommended metrics toggle"
  type = map(object({
    use_recommended_metrics = bool
  }))
  default = {
    ec2 = { use_recommended_metrics = true }
    s3  = { use_recommended_metrics = false }
  }
}
