

# Guide on How to Use Terraform Modules

## Introduction
This guide provides a step-by-step process for using Terraform modules to manage your infrastructure. Management Zone module is used as an example to demonstrate the process.

## Project Structure
The project consists of a root module that calls the child module for the management zone. The child module has its own `main.tf`, `variables.tf`, `outputs.tf`, and `provider.tf` files.
```
project-directory/
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── .gitignore
├── ...
├── modules/
│ ├── management_zone/
│ │ ├── README.md
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ ├── outputs.tf
│ │ ├── provider.tf
│ ├── ...
```

## Steps to Use Terraform Modules

### 1. Set Up Your Project Directory
Create a new directory for your Terraform project. Inside this directory, create a `main.tf` file where you will define your infrastructure. Ensure you have set Dynatrace API token and URL in environment variables or define them in `tfvars` and API token has the correct scope (permissions).

### 2. Initialize the Directory
Run `terraform init` in your project directory to initialize the directory and download necessary provider plugins.

### 3. Define the Modules
In your `main.tf` file, define the modules you want to use. For example, to use the Management Zone module:

#### Management Zone Module
```hcl
module "management_zone" {
  source = "./modules/management_zone"
  zone_name = var.zone_name
  zone_description = var.zone_description
  zone_legacy_id = var.zone_legacy_id
  entity_selector = var.entity_selector
}
```
**Purpose**: This module is used to create a management zone.
**Source**: The module is sourced from the `./modules/management_zone` directory.
**Variables**:
- `zone_name`: The name of the management zone.
- `zone_description`: The description of the management zone.
- `zone_legacy_id`: The legacy ID of the management zone.
- `entity_selector`: The entity selector for the management zone rules.

### 4. Configure Variables
Create a `variables.tf` file and define the variables required by the modules. For example:
```hcl
variable "zone_name" {
  description = "The name of the management zone"
  type = string
}
variable "zone_description" {
  description = "The description of the management zone"
  type = string
}
variable "zone_legacy_id" {
  description = "The legacy ID of the management zone"
  type = string
}
variable "entity_selector" {
  description = "The entity selector for the management zone rules"
  type = string
}
```

### 5. Set Variable Values
Create a `terraform.tfvars` file to set the values for these variables. For example:
```hcl
zone_name = "example_zone"
zone_description = "This is an example management zone"
zone_legacy_id = "legacy-id-example"
entity_selector = "type(\"HOST\")"
```

### 6. Plan the Infrastructure
Run `terraform plan` to see what changes will be made to your infrastructure. This step helps you verify that your configuration is correct.

### 7. Apply the Configuration
Run `terraform apply` to create or update your infrastructure based on the configuration.

### 8. Review and Manage State
Terraform maintains the state of your infrastructure in a `terraform.tfstate` file. Ensure this file is managed properly, especially in a team environment.

### 9. Destroy the Infrastructure (if needed)
If you need to tear down the infrastructure, run `terraform destroy`.

## Diagram
Here’s a diagram to illustrate the structure:
```plaintext
Root Module
 ├── README.md
 ├── main.tf
 ├── variables.tf
 ├── outputs.tf
 ├── provider.tf
 ├── .gitignore
 ├── ...
 ├── modules/
 │ ├── management_zone/
 │ │ ├── README.md
 │ │ ├── main.tf
 │ │ ├── variables.tf
 │ │ ├── outputs.tf
 │ │ ├── provider.tf
 │ ├── ...
```

## How It Works

### Management Zone Module
This module creates a management zone using the provided variables (`zone_name`, `zone_description`, `zone_legacy_id`, `entity_selector`).

# Code Promotion PR Process from Dev to QA to Prod for Terraform Modules

## Introduction
This guide outlines the process for promoting code changes from Development (Dev) to Quality Assurance (QA) to Production (Prod) for Terraform modules. The process ensures that updates are thoroughly tested and reviewed before being made available to customers.

## Code Promotion Process

### 1. Development Stage
- **Code Development**: Developers write and commit code to the feature branch. This includes updates or additions to Terraform modules.
- **Code Review**: Create a Pull Request (PR) for code review. Team members review the code for quality and adherence to standards.
- **Unit Testing**: Ensure all unit tests pass before merging the PR.

### 2. Merge to Dev Branch
- **Merge PR**: Once the code review is approved, merge the PR into the `dev` branch.
- **Integration Testing**: Run integration tests to ensure the new code works well with existing code.
- **Terraform Deployment Test**: Deploy the updated Terraform modules in a test environment to verify their functionality.
- **Automated Builds**: Trigger automated builds to verify the integration.

### 3. Promotion to QA
- **Create PR for QA**: Create a PR to merge the `dev` branch into the `qa` branch.
- **QA Review**: QA team reviews the PR and may run additional tests.
- **Acceptance Testing**: Conduct acceptance testing to validate the functionality.
- **Merge to QA**: Once approved, merge the PR into the `qa` branch.

### 4. Promotion to Production
- **Create PR for Prod**: Create a PR to merge the `qa` branch into the `prod` branch.
- **Final Review**: Conduct a final review to ensure everything is ready for production.
- **Approval from Public Facing Terraform Repo Team**: Obtain approval from the team that controls the public-facing Terraform repository.
- **Smoke Testing**: Perform smoke testing in a staging environment to catch any last-minute issues.
- **Merge to Prod**: Once everything is verified and approved, merge the PR into the `prod` branch.

### 5. Post-Deployment
- **Monitoring**: Monitor the production environment for any issues.
- **Rollback Plan**: Have a rollback plan in place in case of critical issues.

## Flowchart
Here’s a simple flowchart to visualize the process:
```plaintext
Start
 v
Code Development (Dev)
 v
Create PR for Code Review
 v
Code Review & Unit Testing
 v
Merge PR to Dev Branch
 v
Integration Testing & Automated Builds
 v
Terraform Deployment Test
 v
Create PR for QA
 v
QA Review & Acceptance Testing
 v
Merge PR to QA Branch
 v
Create PR for Prod
 v
Final Review & Smoke Testing
 v
Approval from Public Facing Terraform Repo Team
 v
Merge PR to Prod Branch
 v
Post-Deployment Monitoring
 v
End
```

## Best Practices for Updating Terraform Modules

### Version Control
- Use version control for your Terraform configuration files to track changes and collaborate with team members.
- Ensure that all changes are committed to the feature branch before creating a PR.

### State Management
- Use remote state storage (e.g., AWS S3, Terraform Cloud) to manage your state file securely and collaboratively.
- Regularly back up your state file to prevent data loss.

### Modularization
- Break down your Terraform configuration into reusable modules to improve maintainability and scalability.
- Ensure that each module has a clear purpose and is well-documented.

### Testing
- Regularly test your Terraform configurations using tools like `terraform validate` and `terraform plan`.
- Conduct thorough integration and acceptance testing to ensure that updates do not introduce any issues.

### Documentation
- Maintain clear and comprehensive documentation for your Terraform modules and processes to ensure consistency and ease of use.
- Update documentation to reflect any changes or additions to the modules.

### Security
- Implement security best practices, such as using IAM roles and policies, to protect your infrastructure and data.
- Regularly review and update security policies to address new threats.

### Code Promotion PR Process
- **Follow the Code Promotion PR Process**: It is good to follow the code promotion PR process when an update in the modules is made because it ensures that all changes are thoroughly tested and reviewed before being made available to customers. This helps maintain the quality and stability of the modules.
- **Benefits**:
  - **Quality Assurance**: Ensures that the code meets quality standards and adheres to best practices.
  - **Collaboration**: Facilitates collaboration among team members through code reviews and approvals.
  - **Testing**: Provides multiple stages of testing (unit, integration, acceptance) to catch issues early.
  - **Approval**: Requires approval from the team that controls the public-facing Terraform repository, ensuring that only vetted changes are deployed.
  - **Monitoring**: Includes post-deployment monitoring to quickly identify and address any issues.

---

