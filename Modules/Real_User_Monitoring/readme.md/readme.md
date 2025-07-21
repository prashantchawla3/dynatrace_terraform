
# Dynatrace Real User Monitoring (RUM) Terraform Modules

This provides a modular, reusable Terraform setup to configure Dynatrace Real User Monitoring (RUM) features. It enables infrastructure teams to declaratively manage RUM settings such as geolocation and more using separate Terraform modules.

## Folder Structure

```

real-user/
├── main.tf                 # Main entry point to call each RUM module
├── variables.tf            # Input variables for the real-user configuration
├── terraform.tfvars        # Sample or actual input values
├── outputs.tf              # Output values from modules
└── modules/                # Reusable modules for each RUM feature


````

Each module contains its own `main.tf`, `variables.tf`, and `outputs.tf`.

---



###  Prerequisites

- Terraform v1.0+
- Dynatrace account
- A Dynatrace API token with permissions to manage RUM settings
- Provider block in your environment:
```hcl
terraform {
  required_providers {
    dynatrace = {
      source  = "dynatrace-oss/dynatrace"
      version = "~> 1.15.0"
    }
  }
}
````

---

###  Usage

In the `real-user/main.tf`, modules are declared like so:

```hcl
module "geolocation" {
  source = "./modules/geolocation"
  // required variables
}

module "cookie_capturing" {
  source = "./modules/cookie-capturing"
  // required variables
}

// and so on...
```

You pass variables using `terraform.tfvars` or `-var` flags.

---


##  Outputs

Each module exposes relevant outputs. For example:

```hcl
output "geolocation_status" {
  value = module.geolocation.status
}
```

---



## Commands

```bash
terraform init
terraform plan
terraform apply
```

Use `terraform destroy` to remove resources when needed.

---

