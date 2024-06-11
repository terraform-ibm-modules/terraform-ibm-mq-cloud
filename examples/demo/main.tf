########################################################################################################################
# Resource group
########################################################################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.1.5"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

########################################################################################################################
# MQ on Cloud
########################################################################################################################

module "mqcloud_instance" {
  source                    = "../../modules/mq-instance"
  name                      = "${var.prefix}-mq-instance"
  region                    = var.region
  resource_group_id         = module.resource_group.resource_group_id
  existing_mq_capacity_guid = var.existing_mq_capacity_guid
}

data "external" "location" {
  program = ["bash", "./mq-location"]
  query = {
    api_key    = var.ibmcloud_api_key
    endpoint   = var.mq_restapi_endpoint
    deployment = module.mqcloud_instance.deployment_guid
  }
}

module "queue_manager" {
  source                = "../../modules/queue-manager"
  display_name          = "${var.prefix}-qm-display"
  location              = data.external.location.result.location
  name                  = "${var.prefix}_qm"
  service_instance_guid = module.mqcloud_instance.deployment_guid
  size                  = "xsmall"
  queue_manager_version = "9.3.5_3"
}
