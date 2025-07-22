
# ─── Launchpads ─────────────────────────────────────────────
module "default_launchpads" {
  source             = "./modules/dynatrace_default_launchpad"
  default_launchpads = var.default_launchpads
}

# ─── Documents ──────────────────────────────────────────────
module "documents" {
  source   = "./modules/dynatrace_document"
  documents = var.documents
}

# ─── Direct Sharing Rules ──────────────────────────────────
module "direct_shares" {
  source        = "./modules/dynatrace_direct_shares"
  direct_shares = var.direct_shares
}
