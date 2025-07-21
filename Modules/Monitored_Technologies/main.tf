
# ─── Technology Monitoring per Host ───────────────────────
module "technologies_monitoring" {
  source       = "./modules/technologies_monitoring"
  technologies = var.technologies
}
