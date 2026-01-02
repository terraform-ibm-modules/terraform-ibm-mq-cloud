########################################################################################################################
# Resource group
########################################################################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.4.7"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

########################################################################################################################
# MQ on Cloud
########################################################################################################################

locals {
  prefix_split  = split("-", var.prefix)
  prefix_offset = length(local.prefix_split) > 1 ? length(local.prefix_split) - 1 : 0
  prefix        = local.prefix_split[local.prefix_offset]
}

# tflint 0.55.1 has an issue https://github.com/terraform-linters/tflint/issues/2243
# Remove certificate features until it is resolved
module "mq_on_cloud" {
  source            = "../.."
  resource_group_id = module.resource_group.resource_group_id

  name                     = "${var.prefix}-mq-instance"
  region                   = var.region
  tags                     = var.resource_tags
  existing_mq_capacity_crn = var.existing_mq_capacity_crn
  subscription_id          = var.subscription_id

  queue_manager_display_name = "${var.prefix}-qm-display"
  queue_manager_name         = "${local.prefix}_qm"
  queue_manager_size         = "xsmall"

  applications = {
    "app-${local.prefix}" = {
      name = "application-1"
    }
  }
  users = {
    "user-${local.prefix}" = {
      name  = "user-1"
      email = "user-1@example.com"
    }
  }
  #keystore_certificates = var.keystore_certificate == null ? {} : {
  #  "${var.prefix}-ks-cert" = {
  #    certificate = var.keystore_certificate
  #    label       = "ks_cert_1"
  #  }
  #}
  #truststore_certificates = var.truststore_certificate == null ? {} : {
  #  "${var.prefix}-ts-cert" = {
  #    certificate = var.truststore_certificate
  #    label       = "ts_cert_1"
  #  }
  #}

}
