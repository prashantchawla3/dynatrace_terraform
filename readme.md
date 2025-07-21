# Dynatrace OpenPipeline Terraform Module

This Terraform module provisions and configures Dynatrace OpenPipeline resources including business events, events, logs, security events, and SDLC events. It supports flexible configuration of pipelines, endpoints, and routing rules for each event type.

---

##  Required API Token Scopes

- `settings.read`
- `settings.write`

---

##  How to Determine Values for `tfvars`

To configure this module:

- Enable each resource type using the corresponding `enable_*` boolean variable.
- Provide lists of pipeline, endpoint, and routing configurations as required.
- Each configuration block must match the schema defined in `variables.tf`.

Refer to the `sample.tfvars` file for a complete example.

---

## Full Schema

### 🔹 Business Events

- **enable_business_events** (bool): Enable business event pipelines.
- **business_event_pipelines** (list of objects):
  - **enabled** (bool)
  - **display_name** (string)
  - **id** (string)
  - **processing** (list of objects):
    - **description** (string)
    - **enabled** (bool)
    - **fields** (list of strings)
    - **id** (string)
    - **matcher** (string)

### 🔹 Events

- **enable_events** (bool)
- **events_endpoints** (list of objects):
  - **enabled** (bool)
  - **default_bucket** (string)
  - **display_name** (string)
  - **segment** (string)
  - **routing** (object):
    - **type** (string)
    - **pipeline_id** (string)
- **events_pipelines** (list of objects):
  - **enabled** (bool)
  - **display_name** (string)
  - **id** (string)
- **events_routing** (list of objects):
  - **enabled** (bool)
  - **matcher** (string)
  - **note** (string)
  - **pipeline_id** (string)

### 🔹 Logs

- **enable_logs** (bool)
- **logs_pipelines** (list of objects):
  - **enabled** (bool)
  - **display_name** (string)
  - **id** (string)

### 🔹 Security Events

- **enable_security_events** (bool)
- **security_event_pipelines** (list of objects):
  - **enabled** (bool)
  - **display_name** (string)
  - **id** (string)

### 🔹 SDLC Events

- **enable_sdlc_events** (bool)
- **sdlc_endpoints** (list of objects):
  - **display_name** (string)
  - **enabled** (bool)
  - **segment** (string)
  - **routing** (object):
    - **type** (string)
    - **pipeline_id** (string)
- **sdlc_pipelines** (list of objects):
  - **display_name** (string)
  - **enabled** (bool)
  - **id** (string)
- **sdlc_routing** (list of objects):
  - **enabled** (bool)
  - **matcher** (string)
  - **note** (string)
  - **pipeline_id** (string)

---

## 🛠 Example Usage

```hcl
module "openpipeline" {
  source = "./modules/openpipeline"

  enable_business_events = true
  business_event_pipelines = var.business_event_pipelines

  enable_events = true
  events_endpoints = var.events_endpoints
  events_pipelines = var.events_pipelines
  events_routing = var.events_routing

  enable_logs = true
  logs_pipelines = var.logs_pipelines

  enable_security_events = true
  security_event_pipelines = var.security_event_pipelines

  enable_sdlc_events = true
  sdlc_endpoints = var.sdlc_endpoints
  sdlc_pipelines = var.sdlc_pipelines
  sdlc_routing = var.sdlc_routing
}
