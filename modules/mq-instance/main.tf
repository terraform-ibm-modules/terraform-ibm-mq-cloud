##############################################################################
# terraform-ibm-mq-cloud
#
# Create an MQ on Cloud SaaS instance
##############################################################################

locals {
  # Capacity instance
  split_capacity_crn        = var.existing_mq_capacity_crn != null ? split(":", var.existing_mq_capacity_crn) : []
  existing_mq_capacity_guid = length(local.split_capacity_crn) >= 8 ? local.split_capacity_crn[7] : null

  mq_capacity_guid = var.existing_mq_capacity_crn != null ? local.existing_mq_capacity_guid : ibm_resource_instance.mqcloud_capacity[0].id
}

resource "ibm_resource_instance" "mqcloud_capacity" {
  count             = var.existing_mq_capacity_crn != null ? 0 : 1
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

data "ibm_mqcloud_queue_manager_options" "options" {
  service_instance_guid = resource.ibm_resource_instance.mqcloud_deployment.guid
}
