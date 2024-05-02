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

  name         = "${var.prefix}-mq-instance"
  region       = var.region
  service_plan = var.service_plan
  tags         = var.resource_tags

  queue_manager_display_name = "${var.prefix}-qm-display"
  queue_manager_location     = var.region
  queue_manager_name         = "${var.prefix}_qm"
  queue_manager_size         = "lite"
  queue_manager_version      = "9.3.2_2"

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
  keystore_certificates = {
    "${var.prefix}-ks-cert" = {
      certificate = "private.de.icr.io/icr_namespace/image-name"
      label       = "ks_cert_1"
    }
  }
  truststore_certificates = {
    "${var.prefix}-ts-cert" = {
      certificate = "private.de.icr.io/icr_namespace/image-name"
      label       = "ts_cert_1"
    }
  }

}
