
#  Process Monitoring with Terraform and Dynatrace

This Terraform project automates the provisioning of Dynatrace process monitoring configurations using modular design. Each feature is implemented as a separate reusable module under the `modules/` directory.

---

##  Project Structure

```

Process\_monitoring/
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│   ├── dynatrace\_cloudapp\_workloaddetection/
│   ├── dynatrace\_declarative\_grouping/
│   ├── dynatrace\_pg\_alerting/
│   ├── dynatrace\_process\_group\_detection/
│   ├── dynatrace\_process\_group\_detection\_flags/
│   ├── dynatrace\_process\_group\_monitoring/
│   ├── dynatrace\_process\_group\_simple\_detection/
│   ├── dynatrace\_processgroup\_naming/
│   ├── dynatrace\_processgroup\_naming\_order/
├── readme/
│   └── samples.tfvars

````

---

##  Modules Used

Each module represents a different aspect of Dynatrace process group management:

- `dynatrace_cloudapp_workloaddetection`
- `dynatrace_declarative_grouping`
- `dynatrace_pg_alerting`
- `dynatrace_process_group_detection`
- `dynatrace_process_group_detection_flags`
- `dynatrace_process_group_monitoring`
- `dynatrace_process_group_simple_detection`
- `dynatrace_processgroup_naming`
- `dynatrace_processgroup_naming_order`

---

##  Usage

1. Clone this repository:
   ```bash
   
   cd Process_monitoring
````

2. Initialize the Terraform backend and modules:

  
   terraform init


3. Review and customize your variables file:


4. Apply the configuration:

   
   terraform apply -var-file="readme/samples.tfvars"
  



 Prerequisites

* [Terraform](https://developer.hashicorp.com/terraform/install) v1.0+
* Dynatrace environment with API token
* Correct values defined in `samples.tfvars`


 Variables

Each module has its own input variables, all defined in `variables.tf`. You are expected to pass their values via the `.tfvars` file.

Example for one module in `example.tfvars`:


cloudapp_workloaddetection = [
  {
    name       = "My Cloud App Detection"
    enabled    = true
    conditions = [...]
  }
]

pg_alertings = [
  {
    name        = "Alert on CPU Spike"
    processName = "java"
    threshold   = 90
  }
]

 and so on for other modules


 