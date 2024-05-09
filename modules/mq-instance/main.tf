##############################################################################
# terraform-ibm-mq-cloud
#
# Create an MQ on Cloud SaaS instance
##############################################################################

resource "ibm_resource_instance" "mqcloud_capacity" {
  location          = var.region
  name              = var.name
  plan              = "reserved-capacity"
  resource_group_id = var.resource_group_id
  service           = "mqcloud"
  tags              = var.tags
}

resource "ibm_resource_instance" "mqcloud_deployment" {
  location          = var.region
  name              = var.name
  plan              = "reserved-deployment"
  resource_group_id = var.resource_group_id
  parameters = {
    "undocumented_property" = "location name or id that can not be looked up"
  }
  service = "mqcloud"
  tags    = var.tags
}
