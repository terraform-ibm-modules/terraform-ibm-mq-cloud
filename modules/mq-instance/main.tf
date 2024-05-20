##############################################################################
# terraform-ibm-mq-cloud
#
# Create an MQ on Cloud SaaS instance
##############################################################################

locals {
  mq_capacity_guid = var.existing_mq_capacity_guid != null ? var.existing_mq_capacity_guid : ibm_resource_instance.mqcloud_capacity[0].guid
}

resource "ibm_resource_instance" "mqcloud_capacity" {
  count             = var.existing_mq_capacity_guid != null ? 0 : 1
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
    "selectedCapacityPlan" = local.mq_capacity_guid
  }
  service = "mqcloud"
  tags    = var.tags
}
