########################################################################################################################
# Validation and local configuration
########################################################################################################################

locals {
  # Deployment instance
  split_deployment_crn        = var.existing_mq_deployment_crn == null ? [] : split(":", var.existing_mq_deployment_crn)
  existing_mq_deployment_guid = length(local.split_deployment_crn) >= 8 ? local.split_deployment_crn[7] : null
  mq_deployment_crn           = var.existing_mq_deployment_crn == null ? module.mqcloud_instance[0].deployment_crn : var.existing_mq_deployment_crn
  mq_deployment_guid          = var.existing_mq_deployment_crn == null ? module.mqcloud_instance[0].deployment_guid : local.existing_mq_deployment_guid

  split_new_deployment_crn = module.mqcloud_instance[0].deployment_guid == null ? [] : split(":", module.mqcloud_instance[0].deployment_guid)
  override_guid            = length(local.split_new_deployment_crn) >= 8 ? local.split_new_deployment_crn[7] : null

  # Queue manager
  create_queue_manager = var.existing_queue_manager_name == null ? true : false

  # Application
  create_application = var.application_name == null ? false : true
  lookup_application = var.existing_application_name == null ? false : true

  # User
  create_user = var.user_name == null ? false : true

  # Certificate, only supports looking up the existing default certificate
  create_certificate = false
}

########################################################################################################################
# Resource group
########################################################################################################################

module "resource_group" {
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.2.0"
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
  tags                     = var.resource_tags
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

locals {
  queue_manager_href                           = local.create_queue_manager ? module.queue_manager[0].href : data.ibm_mqcloud_queue_manager.queue_manager[0].queue_managers[0].href
  queue_manager_id                             = local.create_queue_manager ? module.queue_manager[0].queue_manager_id : data.ibm_mqcloud_queue_manager.queue_manager[0].queue_managers[0].id
  queue_manager_name                           = local.create_queue_manager ? var.queue_manager_name : var.existing_queue_manager_name
  queue_manager_administrator_api_endpoint_url = local.create_queue_manager ? module.queue_manager[0].administrator_api_endpoint_url : data.ibm_mqcloud_queue_manager.queue_manager[0].queue_managers[0].administrator_api_endpoint_url
}

module "experimental_connection" {
  source           = "../../modules/experimental-connection"
  ibmcloud_api_key = var.ibmcloud_api_key
  href             = local.queue_manager_href
}

########################################################################################################################
# MQ queue configuraton
########################################################################################################################

########################################################################################################################
# MQ application
########################################################################################################################

module "application" {
  count                = local.create_application ? 1 : 0
  source               = "../../modules/application"
  name                 = var.application_name
  service_instance_crn = local.mq_deployment_crn
}

data "ibm_mqcloud_application" "application" {
  count                 = local.lookup_application ? 1 : 0
  name                  = var.existing_application_name
  service_instance_guid = local.mq_deployment_guid
}

locals {
  application_create_api_key_uri = local.create_application ? module.application[0].create_api_key_uri : local.lookup_application ? data.ibm_mqcloud_application.application[0].applications[0].create_api_key_uri : null
  application_href               = local.create_application ? module.application[0].href : local.lookup_application ? data.ibm_mqcloud_application.application[0].applications[0].href : null
  application_id                 = local.create_application ? module.application[0].id : local.lookup_application ? data.ibm_mqcloud_application.application[0].applications[0].id : null
}

########################################################################################################################
# MQ user
########################################################################################################################

module "user" {
  count                = local.create_user ? 1 : 0
  source               = "../../modules/user"
  name                 = var.user_name
  email                = var.user_email
  service_instance_crn = local.mq_deployment_crn
}

########################################################################################################################
# MQ CA certificate
########################################################################################################################

data "ibm_mqcloud_truststore_certificate" "certificate" {
  count                 = local.create_certificate ? 0 : 1
  label                 = "LetsEncryptIssuingCA"
  queue_manager_id      = local.queue_manager_id
  service_instance_guid = local.override_guid
}

data "ibm_mqcloud_truststore_certificate" "root_ca_certificate" {
  count                 = local.create_certificate ? 0 : 1
  label                 = "LetsEncryptRootCA"
  queue_manager_id      = local.queue_manager_id
  service_instance_guid = local.override_guid
}

module "experimental_certificate" {
  source           = "../../modules/experimental-certificate"
  depends_on       = [module.experimental_connection]
  ibmcloud_api_key = var.ibmcloud_api_key
  href             = data.ibm_mqcloud_truststore_certificate.certificate[0].trust_store[0].href
}

module "experimental_certificate_root" {
  source           = "../../modules/experimental-certificate"
  depends_on       = [module.experimental_certificate]
  ibmcloud_api_key = var.ibmcloud_api_key
  href             = data.ibm_mqcloud_truststore_certificate.root_ca_certificate[0].trust_store[0].href
}

########################################################################################################################
# Secrets manager
########################################################################################################################

module "sm_crn" {
  count   = var.existing_secrets_manager_crn != null ? 1 : 0
  source  = "terraform-ibm-modules/common-utilities/ibm//modules/crn-parser"
  version = "1.1.0"
  crn     = var.existing_secrets_manager_crn
}

module "secret_group" {
  count                    = var.existing_secrets_manager_crn != null && var.existing_secret_group_id == null ? 1 : 0
  source                   = "terraform-ibm-modules/secrets-manager-secret-group/ibm"
  version                  = "1.3.7"
  region                   = module.sm_crn[0].region
  secrets_manager_guid     = module.sm_crn[0].service_instance
  secret_group_name        = var.secret_group_name
  secret_group_description = "MQ DA module secrets"
  endpoint_type            = var.secrets_manager_endpoint_type
}

locals {
  secret_group_id              = var.existing_secrets_manager_crn == null ? null : (var.existing_secret_group_id == null ? module.secret_group[0].secret_group_id : var.existing_secret_group_id)
  certificate_secret_name      = "mq-da-cert-${local.queue_manager_name}"
  root_certificate_secret_name = "mq-da-root-cert-${local.queue_manager_name}"
}

module "certificate_secret" {
  count                   = var.existing_secrets_manager_crn != null ? 1 : 0
  source                  = "terraform-ibm-modules/secrets-manager-secret/ibm"
  version                 = "1.7.0"
  region                  = module.sm_crn[0].region
  secrets_manager_guid    = module.sm_crn[0].service_instance
  secret_group_id         = local.secret_group_id
  endpoint_type           = var.secrets_manager_endpoint_type
  secret_name             = local.certificate_secret_name
  secret_description      = "MQ DA ${local.queue_manager_name}"
  secret_type             = "arbitrary"
  secret_payload_password = module.experimental_certificate.certificate
}

module "root_certificate_secret" {
  count                   = var.existing_secrets_manager_crn != null ? 1 : 0
  source                  = "terraform-ibm-modules/secrets-manager-secret/ibm"
  version                 = "1.7.0"
  region                  = module.sm_crn[0].region
  secrets_manager_guid    = module.sm_crn[0].service_instance
  secret_group_id         = local.secret_group_id
  endpoint_type           = var.secrets_manager_endpoint_type
  secret_name             = local.root_certificate_secret_name
  secret_description      = "MQ DA ${local.queue_manager_name}"
  secret_type             = "arbitrary"
  secret_payload_password = module.experimental_certificate_root.certificate
}
