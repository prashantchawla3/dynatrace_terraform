resource "dynatrace_devobs_git_onprem" "this" {
  git_provider = var.git_onprem_provider
  url          = var.git_onprem_url
}
