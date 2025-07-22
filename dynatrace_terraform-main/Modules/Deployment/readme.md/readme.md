

# Dynatrace Lambda Agent Version Module

##  Overview

This module retrieves version information for Dynatrace language-specific Lambda agents using the `dynatrace_lambda_agent_version` data source. It allows users to specify which versions of the agent they want to use for various runtimes (Java, Node.js, Python), with or without a collector.

This is particularly useful when managing AWS Lambda instrumentation through Dynatrace in a consistent and version-controlled way across environments.

---

##  Resources Used

### `data "dynatrace_lambda_agent_version" "this"`

This **data source** fetches the version strings for Dynatrace Lambda agents across supported languages. It supports versions for:

* Java
* Node.js
* Python
  With and without collectors, plus a general `collector` version.

###  Outputs

| Output Name                   | Description                                                                      |
| ----------------------------- | -------------------------------------------------------------------------------- |
| `lambda_agent_version_all`    | Outputs the entire `dynatrace_lambda_agent_version.this` object with all values. |
| `lambda_agent_version_java`   | Outputs only the Java agent version.                                             |
| `lambda_agent_version_nodejs` | Outputs only the Node.js agent version.                                          |
| `lambda_agent_version_python` | Outputs only the Python agent version.                                           |

---

## Input Variables

### `lambda_agent_version`

| Name                    | Type                | Description                                                                 | Default                      |
| ----------------------- | ------------------- | --------------------------------------------------------------------------- | ---------------------------- |
| `collector`             | `string` (optional) | Version of the general collector binary (used by multiple language agents). | `"1.259.0"`                  |
| `java`                  | `string` (optional) | Version of the Dynatrace Lambda Java agent.                                 | `"1.259.0-java"`             |
| `java_with_collector`   | `string` (optional) | Version of the Java agent with the collector bundled.                       | `"1.259.0-java-collector"`   |
| `nodejs`                | `string` (optional) | Version of the Dynatrace Lambda Node.js agent.                              | `"1.259.0-nodejs"`           |
| `nodejs_with_collector` | `string` (optional) | Version of the Node.js agent with collector.                                | `"1.259.0-nodejs-collector"` |
| `python`                | `string` (optional) | Version of the Dynatrace Lambda Python agent.                               | `"1.259.0-python"`           |
| `python_with_collector` | `string` (optional) | Version of the Python agent with collector.                                 | `"1.259.0-python-collector"` |

These versions are configurable, but sensible defaults are provided.

---

##  Example Usage

```hcl
module "lambda_agent_version" {
  source = "./modules/dynatrace_lambda_agent_version"

  lambda_agent_version = {
    collector             = "1.259.0"
    java                  = "1.259.0-java"
    java_with_collector   = "1.259.0-java-collector"
    nodejs                = "1.259.0-nodejs"
    nodejs_with_collector = "1.259.0-nodejs-collector"
    python                = "1.259.0-python"
    python_with_collector = "1.259.0-python-collector"
  }
}
```
## How to Use

1. Update or use the provided `sample.tfvars` file in the root directory to supply values for the modules.
2. All modules are already called in the `main.tf` file in the root.
3. You only need to run the following commands to deploy:

```bash
terraform init
terraform plan -var-file="readme.md/sample.tfvars"
terraform apply -var-file="readme.md/sample.tfvars"
```

---


You may also choose to disable versions by setting any of the fields to `null`, e.g.:

```hcl
lambda_agent_version = {
  collector             = null
  java                  = null
  java_with_collector   = null
  nodejs                = null
  nodejs_with_collector = null
  python                = null
  python_with_collector = null
}
```

---

## Output Example

Once the module is applied, you can access outputs like this:

```bash
> terraform output lambda_agent_version_java
"1.259.0-java"
```

---

##  Use Cases

* Retrieve centralized version strings for agent binaries across environments (Dev/Test/Prod).
* Dynamically inject Lambda agent versions into other modules or resources.
* Simplify agent version updates using a single version object.

---

##  Security & Best Practices

* **Do not** hardcode secrets or access keys into the version object.
* This module **does not** expose or handle sensitive data.
* Keep your agent versions up to date to take advantage of the latest features and security patches.

---

##  Additional Notes

* This module uses Terraform native support for optional object attributes (available since Terraform 0.15+).
* Only the specified agent versions are retrieved — unspecified values will not be requested from Dynatrace.
* Ensure Dynatrace is configured properly for Lambda instrumentation before using this module in production.

---

