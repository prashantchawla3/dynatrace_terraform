

# Terraform Configuration for Dynatrace Resources

## Overview

This Terraform configuration sets up various Dynatrace resources, including automation controller connections, database app feature flags, discovery default rules, discovery feature flags, event-driven Ansible connections, and infrastructure operations app settings.

## Resources Created

When you run `terraform apply`, the following resources will be created:

1. **Dynatrace Automation Controller Connections**: Establishes connections to the automation controller with specified URLs and API tokens.
2. **Dynatrace Database App Feature Flags**: Configures feature flags for the database application.
3. **Dynatrace Discovery Default Rules**: Sets up default rules for discovery findings, including actions and settings.
4. **Dynatrace Discovery Feature Flags**: Configures feature flags for the discovery and coverage application.
5. **Dynatrace Event-Driven Ansible Connections**: Establishes connections to the event-driven Ansible controller with specified URLs and API tokens.
6. **Dynatrace Infrastructure Operations App Settings**: Configures settings for the infrastructure and operations application.

## API Permissions

To successfully create and manage these resources, your API token must have the following scopes:

- **Read settings** (`settings.read`)
- **Write settings** (`settings.write`)

Ensure that your API token includes these permissions to avoid any issues during the Terraform apply process.


