
# Dynatrace Process Monitoring Terraform Project

This Terraform project provisions and manages various Dynatrace process monitoring configurations using a modular structure. Each resource is encapsulated in its own module for maintainability and reuse.

---

## project Structure

```

Process\_monitoring/
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md         # ← This file
├── tfvars/           # ← Contains \*.tfvars files (input sources for modules)
│   
└── Modules/
├── builtin\_process\_monitoring/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── process\_availability/
├── process\_monitoring/
├── process\_monitoring\_rule/
└── process\_visibility/

````

---

##  Modules Overview

Each module in the `Modules/` directory is responsible for managing one type of Dynatrace process monitoring configuration:

| Module | Description |
|--------|-------------|
| `builtin_process_monitoring` | Enables built-in process groups based on technology or executable names |
| `process_availability`       | Configures process availability monitoring rules |
| `process_monitoring`         | Defines process monitoring settings at host group level |
| `process_monitoring_rule`    | Adds process monitoring rules using name or detection rules |
| `process_visibility`         | Sets process visibility and control over max monitored processes |

---

##  How to Use

### 1. Navigate to Project Directory

```bash
cd Process_monitoring/
````

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Apply Configuration with tfvars

Use `.tfvars` files inside the `readme` folder to supply input values:

```bash
terraform apply -var-file="readmey.md/sample.tfvars"
```

---

##  Input Variables

All inputs required by the modules are defined in:

* Root: `variables.tf`
* Per-module: inside `Modules/<module-name>/variables.tf`

The actual values for these variables should be defined in `tfvars/*.tfvars`.

---

## Example Usage in Root `main.tf`

```hcl
module "builtin_process_monitoring" {
  source        = "./Modules/builtin_process_monitoring"
  host_group_id = var.host_group_id
  aspnetcore    = var.aspnetcore
  container     = var.container
}
```

Repeat similar blocks for each module you'd like to use.

---

##  Outputs

All output values are exported through `outputs.tf` and can be used by other stacks or CI/CD pipelines.

---

