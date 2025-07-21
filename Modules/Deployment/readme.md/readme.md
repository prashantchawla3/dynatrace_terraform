
# Dynatrace Terraform Modules Documentation

## `dynatrace_lambda_agent_version` (Data Source)

### Required API Token Scopes
This data source does not require any specific API token scopes, as it retrieves publicly available version metadata.

### tfvars Guidance
No input variables are required for this data source. It is used to retrieve the latest available versions of Dynatrace OneAgent code modules for AWS Lambda runtimes. You can reference the output values in your Terraform configuration to dynamically use the latest versions.

### Schema

- **Optional**
  - `collector` (String): Latest version name of standalone log collector
  - `java` (String): Latest version name of Java code module
  - `java_with_collector` (String): Latest version name of Java code module with log collector
  - `nodejs` (String): Latest version name of Node.js code module
  - `nodejs_with_collector` (String): Latest version name of Node.js code module with log collector
  - `python` (String): Latest version name of Python code module
  - `python_with_collector` (String): Latest version name of Python code module with log collector

- **Read-Only**
  - `id` (String): The ID of this resource

### Data Block Usage
Use this data source to retrieve the latest version strings for Dynatrace Lambda layers. This is useful for dynamically referencing the most up-to-date versions in your Lambda instrumentation modules.

---

