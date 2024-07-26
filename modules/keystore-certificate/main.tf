##############################################################################
# terraform-ibm-mq-cloud
#
# Create an MQ on Cloud keystore certificate
##############################################################################

resource "ibm_mqcloud_keystore_certificate" "mqcloud_keystore_certificate" {
  certificate_file      = var.certificate
  label                 = var.label
  queue_manager_id      = var.queue_manager_id
  service_instance_guid = var.service_instance_guid
}
