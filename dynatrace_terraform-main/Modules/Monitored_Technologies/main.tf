
# ─── Technology Monitoring per Host ───────────────────────
module "technologies_monitoring" {
  source       = "./modules/dyntrace_monitored_technologies"
  technologies = var.technologies
}
