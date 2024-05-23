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

module "mq_on_cloud" {
  source            = "../.."
  resource_group_id = module.resource_group.resource_group_id

  name   = "${var.prefix}-mq-instance"
  region = var.region
  #  service_plan = var.service_plan
  tags                      = var.resource_tags
  existing_mq_capacity_guid = var.existing_mq_capacity_guid

  queue_manager_display_name = "${var.prefix}-qm-display"
  queue_manager_location     = var.existing_mq_location
  queue_manager_name         = "${var.prefix}_qm"
  queue_manager_size         = "xsmall"
  queue_manager_version      = "9.3.2_2"

  applications = {
    "${var.prefix}-app" = {
      name = "application-1"
    },
    "${var.prefix}-app-2" = {
      name = "application-2"
    }
  }
  users = {
    "${var.prefix}-user" = {
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
  service_instance_guid = module.mq_on_cloud.service_instance_deployment_guid
  queue_manager_id      = module.mq_on_cloud.queue_manager_id
  source                = "../../modules/keystore-certificate"
  certificate           = "BEGIN END"
  label                 = "ks_extension"
}

module "truststore" {
  service_instance_guid = module.mq_on_cloud.service_instance_deployment_guid
  queue_manager_id      = module.mq_on_cloud.queue_manager_id
  source                = "../../modules/truststore-certificate"
  certificate           = "BEGIN END"
  label                 = "ts_extension"
}
