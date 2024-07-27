########################################################################################################################
# Resource group
########################################################################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.1.6"
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

module "queue_manager" {
  source                = "../../modules/queue-manager"
  display_name          = "${var.prefix}-qm-display"
  location              = module.mqcloud_instance.queue_manager_options.locations[0]
  name                  = "${var.prefix}_qm"
  service_instance_guid = module.mqcloud_instance.deployment_guid
  size                  = "xsmall"
  queue_manager_version = module.mqcloud_instance.queue_manager_options.latest_version
}
