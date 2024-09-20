##############################################################################
# terraform-ibm-mq-cloud
#
# Create an MQ on Cloud keystore certificate
##############################################################################

locals {
  # Deployment service instance
  split_deployment_crn        = split(":", var.service_instance_crn)
  existing_mq_deployment_guid = length(local.split_deployment_crn) >= 8 ? local.split_deployment_crn[7] : null
}

resource "ibm_mqcloud_keystore_certificate" "mqcloud_keystore_certificate" {
  certificate_file      = var.certificate
  label                 = var.label
  queue_manager_id      = var.queue_manager_id
  service_instance_guid = local.existing_mq_deployment_guid
}
