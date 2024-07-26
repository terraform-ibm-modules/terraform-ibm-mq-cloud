##############################################################################
# terraform-ibm-mq-cloud
#
# Create an MQ on Cloud application
##############################################################################

resource "ibm_mqcloud_application" "mqcloud_application" {
  name                  = var.name
  service_instance_guid = var.service_instance_guid
}
