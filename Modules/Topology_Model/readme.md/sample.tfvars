

generic_relationships_enabled          = true
generic_relationships_created_by       = "Terraform"
generic_relationships_from_role        = "terraformrole"
generic_relationships_from_type        = "os:service"
generic_relationships_to_role          = "terraformrole"
generic_relationships_to_type          = "terraformdestination"
generic_relationships_type_of_relation = "PART_OF"
generic_relationships_sources_condition = "$eq(terraform)"
generic_relationships_sources_source_type = "Metrics"

generic_types_name                     = "terraform:type"
generic_types_enabled                  = true
generic_types_created_by               = "Terraform"
generic_types_display_name             = "TerraformTest"
generic_types_rules_icon_pattern       = "{TerraformIcon}"
generic_types_rules_id_pattern         = "{TerraformPlaceholder}"
generic_types_rules_instance_name_pattern = "{TerraformInstance}"
generic_types_rules_attributes_key     = "TerraformAttribute"
generic_types_rules_attributes_pattern = "{TerraformExtraction}"
generic_types_rules_required_dimensions_key = "TerraformDimension"
generic_types_rules_sources_condition  = "$eq(TerraformCondition)"
generic_types_rules_sources_source_type = "Events"

grail_security_context_entity_type     = "exampletype"
grail_security_context_destination_property = "exampleproperty"
