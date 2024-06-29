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

module "mq_on_cloud" {
  source            = "../.."
  resource_group_id = module.resource_group.resource_group_id

  name   = "${var.prefix}-mq-instance"
  region = var.region
  #  service_plan = var.service_plan
  tags                      = var.resource_tags
  existing_mq_capacity_guid = var.existing_mq_capacity_guid

  queue_manager_display_name = "${var.prefix}-qm-display"
  queue_manager_name         = "${var.prefix}_qm"
  queue_manager_size         = "xsmall"
  queue_manager_version      = "9.3.5_3"

  applications = {
    "${var.prefix}-app" = {
      name = "application-1"
    }
  }
  users = {
    "${var.prefix}-user" = {
      name  = "user-1"
      email = "user-1@example.com"
    }
  }
  #keystore_certificates = {
  #  "${var.prefix}-ks-cert" = {
  #    certificate = var.keystore_certificate
  #    label       = "ks_cert_1"
  #  }
  #}
  truststore_certificates = {
    "${var.prefix}-ts-cert" = {
      certificate = var.truststore_certificate
      label       = "ts_cert_1"
    }
  }

}
