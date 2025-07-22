
# Dynatrace VMware Monitoring Integration Terraform Module

##  Overview

This Terraform module integrates VMware vCenter environments into Dynatrace for monitoring and observability. It automates the setup by configuring Dynatrace to connect with one or more vCenter instances using the `dynatrace_vmware` resource.

This module is **parameterized** using a map of vCenter configurations, making it easy to define multiple vCenters in a single Terraform execution. Each configuration provides connection credentials, IP address, labels, and filtering options.

---

##  Module Structure

```hcl
module "vmware_monitoring" {
  source         = "./modules/dynatrace_vmware"
  vmware_configs = var.vmware_configs
}
```

---

##  Resources

### `dynatrace_vmware.this`

This resource configures a connection between Dynatrace and a VMware vCenter instance. It is created for each item in the `vmware_configs` map.

| Attribute   | Description                                                                         |
| ----------- | ----------------------------------------------------------------------------------- |
| `enabled`   | Enables or disables this integration. Only used to toggle the resource dynamically. |
| `ipaddress` | The IP address or DNS name of the VMware vCenter server.                            |
| `label`     | A friendly name for the vCenter instance within Dynatrace.                          |
| `username`  | The username used to authenticate against vCenter.                                  |
| `password`  | The password for the above user. **Should be stored securely and never hardcoded.** |
| `filter`    | Optional entity selector string to filter monitored VMware entities.                |

---

##  Variables

### `vmware_configs`

**Type:**

```hcl
map(object({
  enabled   = bool
  ipaddress = string
  label     = string
  password  = string
  username  = string
  filter    = string
}))
```

**Description:**
A map containing one or more vCenter configurations. Each item represents a different vCenter integration and includes the necessary connection and filtering details.

**Example Usage:**

```hcl
vmware_configs = {
  "vcenter_prod" = {
    enabled   = true
    ipaddress = "192.168.1.100"
    label     = "Production vCenter"
    username  = "admin"
    password  = var.vcenter_prod_password  # Sensitive value passed via variable
    filter    = "dc=prod*"
  }

  "vcenter_test" = {
    enabled   = false
    ipaddress = "192.168.1.101"
    label     = "Test vCenter"
    username  = "testuser"
    password  = var.vcenter_test_password
    filter    = "dc=test*"
  }
}
```


##  Output

### `vmware_ids`

**Description:**
Returns a map of the unique Dynatrace resource IDs created for each vCenter configuration.

**Example Output:**

```hcl
{
  vcenter_prod = "abcdef1234567890"
}
```

Only the `enabled = true` entries will be included in the output map.

---

##  How to Use

```hcl
module "vmware_monitoring" {
  source         = "./modules/dynatrace_vmware"
  vmware_configs = var.vmware_configs
}
```

---

##  Example Minimal Working Configuration

```hcl
variable "vcenter_prod_password" {
  description = "Password for the production vCenter"
  type        = string
  sensitive   = true
}

variable "vmware_configs" {
  default = {
    "vcenter_prod" = {
      enabled   = true
      ipaddress = "vcenter01.company.com"
      label     = "Production vCenter"
      username  = "monitoring"
      password  = var.vcenter_prod_password
      filter    = "dc=prod*"
    }
  }
}

module "vmware_monitoring" {
  source         = "./modules/dynatrace_vmware"
  vmware_configs = var.vmware_configs
}
```

---

##  Security Considerations

* Passwords should **never** be stored in plaintext in the source code.
* Use `sensitive = true` for variables handling secrets.
* Prefer using environment variables, encrypted variable files, or secret management systems.

---

##  Notes

* Only configurations with `enabled = true` will result in a Dynatrace resource being created.
* This module uses `for_each` on the `dynatrace_vmware` resource, enabling dynamic resource creation per entry.
* You can create as many vCenter configurations as needed by extending the `vmware_configs` map.

---

##  Documentation Links

* [Dynatrace VMware Monitoring Documentation](https://docs.dynatrace.com/docs/infrastructure-monitoring/cloud-platform-monitoring/vmware)
* [Terraform Dynatrace Provider](https://registry.terraform.io/providers/dynatrace-oss/dynatrace/latest/docs)

---
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