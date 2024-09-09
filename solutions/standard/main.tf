########################################################################################################################
# Validation and local configuration
########################################################################################################################

locals {
  # Deployment instance
  split_deployment_crn        = var.existing_mq_deployment_crn == null ? [] : split(":", var.existing_mq_deployment_crn)
  existing_mq_deployment_guid = length(local.split_deployment_crn) >= 8 ? local.split_deployment_crn[7] : null
  mq_deployment_crn           = var.existing_mq_deployment_crn == null ? module.mqcloud_instance[0].deployment_crn : var.existing_mq_deployment_crn
  mq_deployment_guid          = var.existing_mq_deployment_crn == null ? module.mqcloud_instance[0].deployment_guid : local.existing_mq_deployment_guid

  # Queue manager
  create_queue_manager = var.existing_queue_manager_name == null ? true : false
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
# MQ on Cloud deployment instance
########################################################################################################################

module "mqcloud_instance" {
  count                    = var.existing_mq_deployment_crn == null ? 1 : 0
  source                   = "../../modules/mq-instance"
  name                     = var.deployment_name
  region                   = var.region
  resource_group_id        = module.resource_group.resource_group_id
  existing_mq_capacity_crn = var.existing_mq_capacity_crn
}

data "ibm_mqcloud_queue_manager_options" "queue_manager_options" {
  count                 = var.existing_mq_deployment_crn == null ? 0 : 1
  service_instance_guid = local.mq_deployment_guid
}

locals {
  location = var.existing_mq_deployment_crn == null ? module.mqcloud_instance[0].queue_manager_options.locations[0] : data.ibm_mqcloud_queue_manager_options.queue_manager_options[0].locations[0]
  version  = var.existing_mq_deployment_crn == null ? module.mqcloud_instance[0].queue_manager_options.latest_version : data.ibm_mqcloud_queue_manager_options.queue_manager_options[0].latest_version
}

########################################################################################################################
# MQ queue manager
########################################################################################################################

module "queue_manager" {
  count                 = local.create_queue_manager ? 1 : 0
  source                = "../../modules/queue-manager"
  display_name          = var.queue_manager_display_name
  location              = local.location
  name                  = var.queue_manager_name
  service_instance_crn  = local.mq_deployment_crn
  size                  = var.queue_manager_size
  queue_manager_version = local.version
}

data "ibm_mqcloud_queue_manager" "queue_manager" {
  count                 = local.create_queue_manager ? 0 : 1
  name                  = var.existing_queue_manager_name
  service_instance_guid = local.mq_deployment_guid
}

########################################################################################################################
# MQ queue configuraton
########################################################################################################################
