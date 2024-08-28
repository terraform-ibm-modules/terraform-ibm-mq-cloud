########################################################################################################################
# Resource group
########################################################################################################################

locals {
  split_capacity_crn        = split(":", var.existing_mq_capacity_crn)
  existing_mq_capacity_guid = length(local.split_capacity_crn) >= 8 ? local.split_capacity_crn[7] : null
  mq_capacity_crn           = var.existing_mq_capacity_crn

  #split_deployment_crn        = var.existing_mq_deployment_crn == null ? 0 : split(":", var.existing_mq_deployment_crn)
  #existing_mq_deployment_guid = length(local.split_deployment_crn) >= 8 ? local.split_deployment_crn[7] : null
  #mq_deployment_crn            = var.existing_mq_deployment_crn == null ? module.mqcloud_instance.deployment_crn : var.existing_mq_deployment_crn
}

########################################################################################################################
# Resource group
########################################################################################################################

module "resource_group" {
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  resource_group_name          = var.use_existing_resource_group == false ? (var.prefix != null ? "${var.prefix}-${var.resource_group_name}" : var.resource_group_name) : null
  existing_resource_group_name = var.use_existing_resource_group == true ? var.resource_group_name : null
}

########################################################################################################################
# MQ on Cloud
########################################################################################################################

module "mqcloud_instance" {
  # count                     = var.existing_mq_deployment_crn == null ? 1 : 0
  source                    = "../../modules/mq-instance"
  name                      = var.deployment_name
  region                    = var.region
  resource_group_id         = module.resource_group.resource_group_id
  existing_mq_capacity_guid = local.existing_mq_capacity_guid
}

module "queue_manager" {
  source                = "../../modules/queue-manager"
  display_name          = var.queue_manager_display_name
  location              = "temporary" #module.mqcloud_instance.queue_manager_options.locations[0]
  name                  = var.queue_manager_name
  service_instance_guid = module.mqcloud_instance.deployment_guid
  size                  = var.queue_manager_size
  queue_manager_version = module.mqcloud_instance.queue_manager_options.latest_version
}
