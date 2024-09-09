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

locals {
  prefix_split  = split("-", var.prefix)
  prefix_offest = length(local.prefix_split) > 1 ? length(local.prefix_split) - 1 : 0
  prefix        = local.prefix_split[local.prefix_offest]
}

module "mq_on_cloud" {
  source            = "../.."
  resource_group_id = module.resource_group.resource_group_id

  name                     = "${var.prefix}-mq-instance"
  region                   = var.region
  tags                     = var.resource_tags
  existing_mq_capacity_crn = var.existing_mq_capacity_crn

  queue_manager_display_name = "${var.prefix}-qm-display"
  queue_manager_name         = "${local.prefix}_qm"
  queue_manager_size         = "xsmall"
  queue_manager_version      = "9.4.0_1"

  applications = {
    "app-${local.prefix}" = {
      name = "application-1"
    },
    "app2-${local.prefix}" = {
      name = "application-2"
    }
  }
  users = {
    "user-${local.prefix}" = {
      name  = "user-1"
      email = "user-1@example.com"
    }
  }
}

module "application" {
  service_instance_guid = module.mq_on_cloud.service_instance_deployment_guid
  source                = "../../modules/application"
  name                  = "app-ext"
}

module "user" {
  service_instance_guid = module.mq_on_cloud.service_instance_deployment_guid
  source                = "../../modules/user"
  name                  = "another-user"
  email                 = "another@example.com"
}

module "keystore" {
  count                 = var.keystore_certificate == null ? 0 : 1
  service_instance_guid = module.mq_on_cloud.service_instance_deployment_guid
  queue_manager_id      = module.mq_on_cloud.queue_manager_id
  source                = "../../modules/keystore-certificate"
  certificate           = var.keystore_certificate
  label                 = "ks_extension"
}

module "truststore" {
  count                 = var.truststore_certificate == null ? 0 : 1
  service_instance_guid = module.mq_on_cloud.service_instance_deployment_guid
  queue_manager_id      = module.mq_on_cloud.queue_manager_id
  source                = "../../modules/truststore-certificate"
  certificate           = var.truststore_certificate
  label                 = "ts_extension"
}
