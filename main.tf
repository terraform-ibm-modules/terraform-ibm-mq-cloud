##############################################################################
# MQ on Cloud instance and queue manager
##############################################################################
locals {
  mqcloud_guid = var.existing_mq_instance_id != null ? var.existing_mq_instance_id : module.mqcloud_instance[0].guid
}

module "mqcloud_instance" {
  count             = var.existing_mq_instance_id != null ? 0 : 1
  source            = "./modules/mq-instance"
  name              = var.name
  region            = var.region
  resource_group_id = var.resource_group_id
  #  service_plan      = var.service_plan
  tags = var.tags
}

module "queue_manager" {
  source                = "./modules/queue-manager"
  display_name          = var.queue_manager_display_name
  location              = var.queue_manager_location
  name                  = var.queue_manager_name
  service_instance_guid = local.mqcloud_guid
  size                  = var.queue_manager_size
  queue_manager_version = var.queue_manager_version
}

##############################################################################
# MQ on Cloud applications
##############################################################################
module "application" {
  source                = "./modules/application"
  for_each              = var.applications
  service_instance_guid = local.mqcloud_guid
  name                  = each.key
}

##############################################################################
# MQ on Cloud users
##############################################################################
module "user" {
  source                = "./modules/user"
  for_each              = var.users
  service_instance_guid = local.mqcloud_guid
  name                  = each.key
  email                 = each.value.email
}

##############################################################################
# MQ on Cloud keystore certificate
##############################################################################
module "keystore_certificate" {
  source                = "./modules/keystore-certificate"
  for_each              = var.keystore_certificates
  service_instance_guid = local.mqcloud_guid
  certificate           = each.value.certificate
  label                 = each.value.label
  queue_manager_id      = module.queue_manager.id
}

##############################################################################
# MQ on Cloud truststore certificate
##############################################################################
module "truststore_certificate" {
  source                = "./modules/truststore-certificate"
  for_each              = var.truststore_certificates
  service_instance_guid = local.mqcloud_guid
  certificate           = each.value.certificate
  label                 = each.value.label
  queue_manager_id      = module.queue_manager.id
}
