

# Dynatrace Terraform Module

This Terraform module deploys and configures various Dynatrace resources, including Cloud Foundry, Kubernetes monitoring, Kubernetes clusters, Kubernetes applications, and Kubernetes enrichment rules.

## Resources Deployed

### Dynatrace Cloud Foundry
This resource configures Dynatrace monitoring for Cloud Foundry environments.

- **Enabled**: Whether the monitoring is enabled.
- **Active Gate Group**: The group of Active Gates used.
- **API URL**: The API endpoint for Cloud Foundry.
- **Label**: A label for the Cloud Foundry environment.
- **Login URL**: The login URL for Cloud Foundry.
- **Username**: The username for authentication.
- **Password**: The password for authentication.

### Dynatrace Kubernetes Monitoring
This resource configures Dynatrace monitoring for Kubernetes environments.

- **Cloud Application Pipeline Enabled**: Whether the cloud application pipeline is enabled.
- **Event Processing Active**: Whether event processing is active.
- **Filter Events**: Whether to filter events.
- **Include All FDI Events**: Whether to include all FDI events.
- **Open Metrics Built-in Enabled**: Whether built-in Open Metrics are enabled.
- **Open Metrics Pipeline Enabled**: Whether the Open Metrics pipeline is enabled.
- **Scope**: The scope of the monitoring.
- **Event Patterns**: Patterns for event processing.

### Dynatrace Kubernetes
This resource configures Dynatrace monitoring for Kubernetes clusters.

- **Enabled**: Whether the monitoring is enabled.
- **Cluster ID**: The ID of the Kubernetes cluster.
- **Cluster ID Enabled**: Whether the cluster ID is enabled.
- **Label**: A label for the Kubernetes cluster.
- **Scope**: The scope of the monitoring.
- **Active Gate Group**: The group of Active Gates used.
- **Auth Token**: The authentication token.
- **Certificate Check Enabled**: Whether certificate checks are enabled.
- **Endpoint URL**: The endpoint URL for the Kubernetes cluster.
- **Hostname Verification Enabled**: Whether hostname verification is enabled.

### Dynatrace Kubernetes App
This resource configures Dynatrace monitoring for Kubernetes applications.

- **Scope**: The scope of the monitoring.
- **Enable Kubernetes App**: Whether the Kubernetes app monitoring is enabled.

### Dynatrace Kubernetes Enrichment
This resource configures enrichment rules for Kubernetes monitoring.

- **Scope**: The scope of the enrichment.
- **Rules**: The enrichment rules, including type, source, and target.

## Outputs

- **cloud_foundry_ids**: IDs of the created Cloud Foundry resources.
- **k8s_monitoring_ids**: IDs of the created Kubernetes monitoring resources.
- **kubernetes_ids**: IDs of the created Kubernetes resources.
- **kubernetes_app_ids**: IDs of the created Kubernetes app resources.
- **kubernetes_enrichment_ids**: IDs of the created Kubernetes enrichment resources.

## Variables

### cloud_foundry
Configuration for Dynatrace Cloud Foundry.

### k8s_monitoring
Configuration for Kubernetes Monitoring.

### kubernetes
Configuration for Kubernetes.

### kubernetes_app
Configuration for Kubernetes App.

### kubernetes_enrichment
Configuration for Kubernetes Enrichment.

## API Token Scopes
This module requires the following API token scopes:
- **Read settings (settings.read)**
- **Write settings (settings.write)**

---

