
#  Dynatrace OpenPipeline Terraform Module

This Terraform module provisions and manages **Dynatrace OpenPipeline** resources, including pipelines and endpoints for ingesting and processing various event types:

* Business Events
* Standard Events
* Logs
* SDLC (Software Development Lifecycle) Events
* Security Events

The module is **highly configurable** using Terraform variables and supports dynamic configuration of pipelines, processors, and routing rules.

---

##  Resources Created

### 1. `dynatrace_openpipeline_business_events.this`

This resource creates **Business Event Pipelines** which define how custom business telemetry is processed before reaching Dynatrace.

* **Pipelines** may include one or more **processors** (e.g., removing sensitive fields like SSNs).
* Each processor is conditionally applied based on a **matcher** expression (e.g., `"event.type == 'login'"`).

---

### 2. `dynatrace_openpipeline_events.this`

This resource sets up ingestion for **Standard Events** into Dynatrace.

* **Endpoints** define how and where events are ingested.
* **Routing** determines how events are assigned to pipelines.
* **Pipelines** define the actual processing flow.

---

### 3. `dynatrace_openpipeline_logs.this`

This resource provisions **Log Pipelines** to process structured or unstructured application logs.

---

### 4. `dynatrace_openpipeline_sdlc_events.this`

This resource enables ingestion and processing of **Software Development Lifecycle (SDLC) Events** such as build or deploy logs.

* Like standard events, it supports endpoint configuration, pipelines, and routing.

---

### 5. `dynatrace_openpipeline_security_events.this`

This resource provisions pipelines for **security-related event ingestion**, such as threat detection or compliance events.

---

##  Variables and Examples

> All variables are documented below. Values can be overridden via a `.tfvars` file.

---

###  `enable_business_events`

* **Type:** `bool`
* **Description:** Enables provisioning of the `dynatrace_openpipeline_business_events` resource.
* **Default:** `true`

**Example:**

```hcl
enable_business_events = true
```

---

### `business_event_pipelines`

* **Type:** List of objects

* **Description:** List of business event pipelines with optional processors.

* **Structure:**

  ```hcl
  [
    {
      enabled      = true
      display_name = "Business Pipeline 1"
      id           = "business-pipeline-1"
      processing = [
        {
          description = "Remove sensitive fields"
          enabled     = true
          fields      = ["password", "ssn"]
          id          = "remove-fields-1"
          matcher     = "event.type == 'login'"
        }
      ]
    }
  ]
  ```

* **Key Fields:**

  * `enabled`: Enables/disables the pipeline
  * `processing`: List of processors (e.g., field removals)

---

###  `enable_events`

* **Type:** `bool`
* **Description:** Enables standard event ingestion and routing.
* **Default:** `true`

---

###  `events_endpoints`

* **Type:** List of objects

* **Description:** Defines where events are ingested and segmented.

* **Structure:**

  ```hcl
  [
    {
      enabled        = true
      default_bucket = "default-bucket"
      display_name   = "Events Endpoint 1"
      segment        = "segment-1"
      routing = {
        type        = "static"
        pipeline_id = "events-pipeline-1"
      }
    }
  ]
  ```

* **Routing Types Supported:** `static`, `round_robin`, `hash`, etc.

---

###  `events_pipelines`

* **Type:** List of objects
* **Description:** Defines processing logic for event ingestion.
* **Structure:**

  ```hcl
  [
    {
      enabled      = true
      display_name = "Events Pipeline 1"
      id           = "events-pipeline-1"
    }
  ]
  ```

---

###  `events_routing`

* **Type:** List of objects
* **Description:** Specifies how events are routed to pipelines based on matcher rules.
* **Example Matcher:** `"event.source == 'api'"`

---

###  `enable_logs`

* **Type:** `bool`
* **Description:** Enables log ingestion and processing.
* **Default:** `true`

---

###  `logs_pipelines`

* **Type:** List of objects
* **Description:** List of pipelines used to ingest and process logs.
* **Structure:**

  ```hcl
  [
    {
      enabled      = true
      display_name = "Logs Pipeline 1"
      id           = "logs-pipeline-1"
    }
  ]
  ```

---

###  `enable_security_events`

* **Type:** `bool`
* **Description:** Enables ingestion of security event pipelines.
* **Default:** `true`

---

###  `security_event_pipelines`

* **Type:** List of objects
* **Description:** Defines pipelines used to process security-related telemetry.
* **Example:**

  ```hcl
  [
    {
      enabled      = true
      display_name = "Security Pipeline 1"
      id           = "security-pipeline-1"
    }
  ]
  ```

---

###  `enable_sdlc_events`

* **Type:** `bool`
* **Description:** Enables ingestion of SDLC event pipelines.
* **Default:** `false`

---

###  `sdlc_endpoints`

* **Type:** List of objects
* **Description:** Configures endpoint and routing for SDLC pipelines.
* **Example:**

  ```hcl
  [
    {
      display_name = "SDLC Endpoint 1"
      enabled      = true
      segment      = "sdlc-segment-1"
      routing = {
        type        = "dynamic"
        pipeline_id = "sdlc-pipeline-1"
      }
    }
  ]
  ```

---

###  `sdlc_pipelines`

* **Type:** List of objects
* **Description:** Defines pipelines that handle SDLC-related telemetry (e.g., CI/CD events).

---

###  `sdlc_routing`

* **Type:** List of objects
* **Description:** Rules to match SDLC events to pipelines.
* **Example Matcher:** `"event.type == 'build'"`

---

##  How to Use

Create a `main.tf` with:

```hcl
module "dynatrace_pipeline" {
  source = "./path-to-this-module"

  enable_business_events = true
  business_event_pipelines = [
    {
      enabled      = true
      display_name = "Business Events"
      id           = "biz-1"
      processing = [
        {
          description = "Strip passwords"
          enabled     = true
          fields      = ["password"]
          id          = "proc-pass"
          matcher     = "event.type == 'login'"
        }
      ]
    }
  ]
}
```

Run:

```bash
terraform init
terraform plan -var-file=readme.md/samples.tfvars
terraform apply -var-file=readme.md/samples.tfvars
```

---

##  Security Notes

* **No secrets or credentials** are stored in this module.
* Sensitive field filtering is handled via processors (e.g., removing `password`, `ssn`).

---

##  Requirements

* Terraform ≥ 1.0
* Dynatrace OpenPipeline Terraform Provider

---

## References

* [Dynatrace OpenPipeline Docs](https://docs.dynatrace.com/docs)
* [Terraform Registry: Dynatrace Provider](https://registry.terraform.io/providers/dynatrace-oss/dynatrace/latest)

---

