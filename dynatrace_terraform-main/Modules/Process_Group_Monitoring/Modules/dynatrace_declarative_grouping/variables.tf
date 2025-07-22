variable "declarative_groupings" {
  description = "Defines declarative process group rules based on metadata and conditions."
  type = map(object({
    enabled             = bool       # Enable this declarative rule
    scope               = string     # Rule scope, e.g., 'environment'
    id                  = string     # Unique identifier for this rule
    process_group_name  = string     # Display name for the process group
    report              = string     # Reporting behavior, e.g., 'always'
    rules = list(object({
      condition = string             # Matching condition
      property  = string             # Metadata property to match
    }))
  }))
  default = {
    sample_group = {
      enabled            = true
      scope              = "environment"
      id                 = "PGIdentifierSample"
      process_group_name = "PGDisplayNameSample"
      report             = "always"
      rules = [
        { condition = "$contains(TFExecutableSample)", property = "executable" },
        { condition = "$contains(TFCommandSample)", property = "commandLine" }
      ]
    }
  }
}
