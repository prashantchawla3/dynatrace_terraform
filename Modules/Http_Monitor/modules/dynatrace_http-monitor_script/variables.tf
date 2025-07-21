variable "scripts" {
  description = "List of HTTP monitor scripts, each with request blocks containing validation, post-processing, and header injection."
  type = list(object({
    http_id  = string
    requests = list(object({
      description     = string
      method          = string
      url             = string
      post_processing = optional(string)
      configuration = object({
        accept_any_certificate = bool
        follow_redirects       = optional(bool)
        headers = optional(list(object({
          name  = string
          value = string
        })))
      })
      validation = optional(object({
        rules = list(object({
          type  = string
          value = string
        }))
      }))
    }))
  }))
  default = [
    {
      http_id  = "synthetic-api-check"
      requests = [
        {
          description = "GET main API health endpoint"
          method      = "GET"
          url         = "https://api.example.com/health"
          configuration = {
            accept_any_certificate = true
            follow_redirects       = true
            headers = [
              { name = "Authorization", value = "Bearer token123" }
            ]
          }
          validation = {
            rules = [
              { type = "CONTAINS", value = "healthy" }
            ]
          }
        }
      ]
    }
  ]
}
