# dynatrace_appsec_notification: Webhook notification integrations
module "dynatrace_appsec_notification" {
  source        = "./modules/dynatrace_appsec_notification"
  notifications = var.notifications
}

# dynatrace_attack_alerting: Attack alert configuration toggles and naming
module "dynatrace_attack_alerting" {
  source                   = "./modules/dynatrace_attack_alerting"
  attack_alerting_names    = var.attack_alerting_names
  attack_alerting_enabled  = var.attack_alerting_enabled
  enabled_attack_mitigations = var.enabled_attack_mitigations
}

# dynatrace_atack_allowlist: Allowlist configurations for appsec defenses
module "dynatrace_atack_allowlist" {
  source           = "./modules/dynatrace_atack_allowlist"
  attack_allowlists = var.attack_allowlists
}

# dynatrace_attack_rules: Custom rule definitions for attacks
module "dynatrace_attack_rules" {
  source       = "./modules/dynatrace_attack_rules"
  attack_rules = var.attack_rules
}

# dynatrace_attack_settings: Global appsec protection configuration
module "dynatrace_attack_settings" {
  source          = "./modules/dynatrace_attack_settings"
  attack_settings = var.attack_settings
}

# dynatrace_kubernetes_spm: Smartscape Pipeline Monitoring configurations for K8s
module "dynatrace_kubernetes_spm" {
  source         = "./modules/dynatrace_kubernetes_spm"
  kubernetes_spm = var.kubernetes_spm
}

# dynatrace_management_zone_v2: Logical segmentation using management zones
module "dynatrace_management_zone_v2" {
  source           = "./modules/dynatrace_management_zone_v2"
  management_zones = var.management_zones
}

# dynatrace_vulnerability_alerting: Alerting settings for vulnerabilities
module "dynatrace_vulnerability_alerting" {
  source                 = "./modules/dynatrace_vulnerability_alerting"
  vulnerability_alerting = var.vulnerability_alerting
}

# dynatrace_vulnerability_code: Configuration for code-level vulnerability tracking
module "dynatrace_vulnerability_code" {
  source             = "./modules/dynatrace_vulnerability_code"
  vulnerability_code = var.vulnerability_code
}

# dynatrace_vulnerability_settings: Core runtime vulnerability detection and language support
module "dynatrace_vulnerability_settings" {
  source                = "./modules/dynatrace_vulnerability_settings"
  vulnerability_settings = var.vulnerability_settings
}

# dynatrace_vulnebality_third_party: Third-party library vulnerability configuration
module "dynatrace_vulnebality_third_party" {
  source                    = "./modules/dynatrace_vulnebality_third_party"
  vulnerability_third_party = var.vulnerability_third_party
}
