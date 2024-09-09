##############################################################################
# MQ on Cloud instance and queue manager
##############################################################################
locals {
  # Capacity instance
  split_capacity_crn        = var.existing_mq_capacity_crn == null ? null : split(":", var.existing_mq_capacity_crn)
  existing_mq_capacity_guid = var.existing_mq_capacity_crn == null ? null : (length(local.split_capacity_crn) >= 8 ? local.split_capacity_crn[7] : null)

  capacity_crn    = var.existing_mq_capacity_crn == null ? module.mqcloud_instance.capacity_crn : var.existing_mq_capacity_crn
  capacity_guid   = local.existing_mq_capacity_guid != null ? local.existing_mq_capacity_guid : module.mqcloud_instance.capacity_guid
  deployment_crn  = module.mqcloud_instance.deployment_crn
  deployment_guid = module.mqcloud_instance.deployment_guid
}

module "mqcloud_instance" {
  source                    = "./modules/mq-instance"
  name                      = var.name
  region                    = var.region
  resource_group_id         = var.resource_group_id
  existing_mq_capacity_guid = local.existing_mq_capacity_guid
  tags                      = var.tags
}

locals {
  queue_manager_location = var.queue_manager_location != null ? var.queue_manager_location : module.mqcloud_instance.queue_manager_options.locations[0]
}

module "queue_manager" {
  source                = "./modules/queue-manager"
  display_name          = var.queue_manager_display_name
  location              = local.queue_manager_location
  name                  = var.queue_manager_name
  service_instance_guid = local.deployment_guid
  size                  = var.queue_manager_size
  queue_manager_version = var.queue_manager_version
}

##############################################################################
# MQ on Cloud applications
##############################################################################
module "application" {
  source                = "./modules/application"
  for_each              = var.applications
  service_instance_guid = local.deployment_guid
  name                  = each.key
}

##############################################################################
# MQ on Cloud users
##############################################################################
module "user" {
  source                = "./modules/user"
  for_each              = var.users
  service_instance_guid = local.deployment_guid
  name                  = each.key
  email                 = each.value.email
}

##############################################################################
# MQ on Cloud keystore certificate
##############################################################################
module "keystore_certificate" {
  source                = "./modules/keystore-certificate"
  for_each              = var.keystore_certificates
  service_instance_guid = local.deployment_guid
  certificate           = each.value.certificate
  label                 = each.value.label
  queue_manager_id      = module.queue_manager.queue_manager_id
}

##############################################################################
# MQ on Cloud truststore certificate
##############################################################################
module "truststore_certificate" {
  source                = "./modules/truststore-certificate"
  for_each              = var.truststore_certificates
  service_instance_guid = local.deployment_guid
  certificate           = each.value.certificate
  label                 = each.value.label
  queue_manager_id      = module.queue_manager.queue_manager_id
}
