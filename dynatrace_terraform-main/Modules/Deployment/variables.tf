variable "lambda_agent_version" {
  description = "Version map for language-specific Dynatrace Lambda agents. Allows specifying agent binaries with or without the collector for Java, Node.js, and Python runtimes."
  type = object({
    collector             = optional(string)
    java                  = optional(string)
    java_with_collector   = optional(string)
    nodejs                = optional(string)
    nodejs_with_collector = optional(string)
    python                = optional(string)
    python_with_collector = optional(string)
  })
  default = {
    collector             = "1.259.0"
    java                  = "1.259.0-java"
    java_with_collector   = "1.259.0-java-collector"
    nodejs                = "1.259.0-nodejs"
    nodejs_with_collector = "1.259.0-nodejs-collector"
    python                = "1.259.0-python"
    python_with_collector = "1.259.0-python-collector"
  }
}
