module "segment" {
  source             = "./modules/dynatrace_segment"
  segment_name       = var.segment_name
  segment_description = var.segment_description
  segment_is_public  = var.segment_is_public
  segment_query      = var.segment_query
  includes_items     = var.includes_items
}
