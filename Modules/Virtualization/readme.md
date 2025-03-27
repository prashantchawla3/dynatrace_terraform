# Dynatrace Terraform Module

This Terraform module manages Dynatrace VMware resources. It includes configurations for VMware settings along with necessary variables and outputs.

## Table of Contents

- Dynatrace Terraform Module
  - Table of Contents
  - [Usage](#usage)
  - Requirements
  - Providers
  - Resources
  - Inputs
  - Outputs
  - Example

## Usage

To use this module, include it in your Terraform configuration and provide the necessary variables. Below is an example of how to use this module:

```hcl
module "dynatrace_vmware" {
  source = "./path_to_module"

  enabled = var.enabled
  ipaddress = var.ipaddress
  label = var.label
  password = var.password
  username = var.username
  filter = var.filter
}
```

## Requirements

- Terraform >= 0.12
- Dynatrace provider >= 1.0

## Providers

| Name      | Version |
|-----------|---------|
| dynatrace | ~> 1.0  |

## Resources

| Name                                                                 | Type     |
|----------------------------------------------------------------------|----------|
| dynatrace_vmware.example                                  | Resource |

### VMware

```hcl
resource "dynatrace_vmware" "example" {
  enabled = var.enabled
  ipaddress = var.ipaddress
  label = var.label
  password = var.password
  username = var.username
  filter = var.filter
}
```

## Inputs

| Name                                          | Description                                                                 | Type         | Default             |
|-----------------------------------------------|-----------------------------------------------------------------------------|--------------|---------------------|
| enabled                                       | This setting is enabled (true) or disabled (false)                          | `bool`       | `false`             |
| ipaddress                                     | Specify the IP address or name of the vCenter or standalone ESXi host       | `string`     | `"vcenter01"`       |
| label                                         | Name this connection                                                        | `string`     | `"example"`         |
| password                                      | Provide the password for the vCenter or standalone ESXi host                | `string`     | `"your-password-here"` |
| username                                      | Provide user credentials for the vCenter or standalone ESXi host            | `string`     | `"terraform"`       |
| filter                                        | Filter string for the VMware resource                                       | `string`     | `"$contains(Terraform)"` |

## Outputs

| Name                                 | Description                                               |
|--------------------------------------|-----------------------------------------------------------|
| vmware_id                            | The ID of the VMware resource                             |

## Example

```hcl
module "dynatrace_vmware" {
  source = "./path_to_module"

  enabled = false
  ipaddress = "vcenter01"
  label = "example"
  password = "your-password-here"
  username = "terraform"
  filter = "$contains(Terraform)"
}
```

